from collections import Counter
import pandas as pd
import string

import time
import sys
import numpy as np

from utils import clean_text

sigmoid = lambda x: 1 / (1 + np.exp(-x))

sigmoid_output_2_derivative = lambda x: x * (1 - x)

POSITIVE = "POSITIVE"
NEGATIVE = "NEGATIVE"


class SentimentNetwork:
    def __init__(self, reviews, labels, min_count=20, polarity_cutoff=0.05, hidden_nodes=10, learning_rate=0.01):

        np.random.seed(1)

        self.pre_process_data(reviews, labels, polarity_cutoff, min_count)

        self.init_network(len(self.review_vocab), hidden_nodes, 1, learning_rate)

    def pre_process_data(self, reviews, labels, polarity_cutoff, min_count):
        positive_counts = Counter()
        negative_counts = Counter()
        total_counts = Counter()

        for i in range(len(reviews)):
            if labels[i] == POSITIVE:
                for word in reviews[i].split(" "):
                    positive_counts[word] += 1
                    total_counts[word] += 1
            else:
                for word in reviews[i].split(" "):
                    negative_counts[word] += 1
                    total_counts[word] += 1

        pos_neg_ratios = Counter()

        for term, cnt in list(total_counts.most_common()):
            if (cnt >= 50):
                pos_neg_ratio = positive_counts[term] / float(negative_counts[term] + 1)
                pos_neg_ratios[term] = pos_neg_ratio

        for word, ratio in pos_neg_ratios.most_common():
            if ratio > 1:
                pos_neg_ratios[word] = np.log(ratio)
            else:
                pos_neg_ratios[word] = -np.log((1 / (ratio + 0.01)))

        review_vocab = set()
        for review in reviews:
            for word in review.split(" "):
                if (total_counts[word] > min_count):
                    if word in pos_neg_ratios.keys():
                        if (pos_neg_ratios[word] >= polarity_cutoff) or (pos_neg_ratios[word] <= -polarity_cutoff):
                            review_vocab.add(word)
                    else:
                        review_vocab.add(word)

        self.review_vocab = list(review_vocab)

        label_vocab = set()
        for label in labels:
            label_vocab.add(label)

        self.label_vocab = list(label_vocab)

        self.review_vocab_size = len(self.review_vocab)
        self.label_vocab_size = len(self.label_vocab)

        self.word2index = {}
        for i, word in enumerate(self.review_vocab):
            self.word2index[word] = i

        self.label2index = {}
        for i, label in enumerate(self.label_vocab):
            self.label2index[label] = i

    def init_network(self, input_nodes, hidden_nodes, output_nodes, learning_rate):
        self.input_nodes = input_nodes
        self.hidden_nodes = hidden_nodes
        self.output_nodes = output_nodes

        self.learning_rate = learning_rate

        self.weights_0_1 = np.zeros((self.input_nodes, self.hidden_nodes))

        self.weights_1_2 = np.random.normal(0.0, self.output_nodes ** -0.5,
                                            (self.hidden_nodes, self.output_nodes))

        self.layer_1 = np.zeros((1, hidden_nodes))

    @staticmethod
    def get_target_for_label(label):
        if label == POSITIVE:
            return 1
        else:
            return 0

    def train(self, training_reviews_raw, training_labels):

        training_reviews = list()
        for review in training_reviews_raw:
            indices = set()
            for word in review.split(" "):
                if word in self.word2index.keys():
                    indices.add(self.word2index[word])
            training_reviews.append(list(indices))

        assert (len(training_reviews) == len(training_labels))

        correct_so_far = 0

        start = time.time()

        for i in range(len(training_reviews)):

            review = training_reviews[i]
            label = training_labels[i]

            self.layer_1 *= 0
            for index in review:
                self.layer_1 += self.weights_0_1[index]

            layer_2 = sigmoid(self.layer_1.dot(self.weights_1_2))

            layer_2_error = layer_2 - self.get_target_for_label(label)
            layer_2_delta = layer_2_error * sigmoid_output_2_derivative(layer_2)

            layer_1_error = layer_2_delta.dot(self.weights_1_2.T)
            layer_1_delta = layer_1_error

            self.weights_1_2 -= self.layer_1.T.dot(layer_2_delta) * self.learning_rate

            for index in review:
                self.weights_0_1[index] -= layer_1_delta[0] * self.learning_rate

            if layer_2 >= 0.5 and label == POSITIVE:
                correct_so_far += 1
            elif layer_2 < 0.5 and label == NEGATIVE:
                correct_so_far += 1

            elapsed_time = float(time.time() - start)
            reviews_per_second = i / elapsed_time if elapsed_time > 0 else 0

            if i % 2500 == 0:
                sys.stdout.write("\rProgress:" + str(100 * i / float(len(training_reviews)))[:4] \
                                 + "% Speed(reviews/sec):" + str(reviews_per_second)[0:5] \
                                 + " #Correct:" + str(correct_so_far) + " #Trained:" + str(i + 1) \
                                 + " Training Accuracy:" + str(correct_so_far * 100 / float(i + 1))[:4] + "%")

    def test(self, testing_reviews, testing_labels):

        correct = 0

        start = time.time()

        for i in range(len(testing_reviews)):
            pred = self.predict(testing_reviews[i])
            if pred == testing_labels[i]:
                correct += 1

            elapsed_time = float(time.time() - start)
            reviews_per_second = i / elapsed_time if elapsed_time > 0 else 0

            sys.stdout.write("\rProgress:" + str(100 * i / float(len(testing_reviews)))[:4] \
                             + "% Speed(reviews/sec):" + str(reviews_per_second)[0:5] \
                             + " #Correct:" + str(correct) + " #Tested:" + str(i + 1) \
                             + " Testing Accuracy:" + str(correct * 100 / float(i + 1))[:4] + "%")

    def predict(self, review):
        self.layer_1 *= 0
        unique_indices = set()
        for word in review.lower().split(" "):
            if word in self.word2index.keys():
                unique_indices.add(self.word2index[word])
        for index in unique_indices:
            self.layer_1 += self.weights_0_1[index]

        layer_2 = sigmoid(self.layer_1.dot(self.weights_1_2))

        if layer_2[0] >= 0.5:
            return POSITIVE
        else:
            return NEGATIVE


def run_network(df, fieldname, labelname):
    mlp = SentimentNetwork(df[fieldname].values, df[fieldname].values, learning_rate=0.1)

    mlp.train(df[fieldname].values, df[labelname].values)
    return mlp


if __name__ == '__main__':
    pos_neg_ratios = Counter()
    reviews = pd.read_csv("reviews.csv", encoding="utf-8")
    ratings = pd.read_csv("ratings.csv", encoding="utf-8")
    review_ratings = pd.merge(reviews, ratings)

    review_ratings["binary_ratings"] = review_ratings["ratings"].apply(lambda x: POSITIVE if x > 3 else NEGATIVE)
    review_ratings = review_ratings[review_ratings["unixReviewTime"] > 1403913600]

    review_ratings = clean_text(review_ratings, "summary")

    print(review_ratings.shape)
    mlp = run_network(review_ratings, "summary", "binary_ratings")
    prediction = mlp.predict("good")
    print(prediction)
    prediction = mlp.predict("Bad")
    print(prediction)

    # filter_punctuations = lambda text: "".join(list(filter(lambda x: x not in string.punctuation, str(text))))
    #
    #
    # def clean_text_field(df, fieldname):
    #     df[fieldname] = df[fieldname].str.lower()
    #     df[fieldname] = df[fieldname].apply(filter_punctuations)
    #     df.dropna(subset=[fieldname], inplace=True)
    #     return df
    #
    #
    # review_ratings = clean_text_field(review_ratings, "summary")
    #
    # counters = review_ratings.groupby("ratings").apply(lambda x: Counter(x.summary.str.split(" ").sum()))
    # total_counts = counters.sum()
    #
    #
    # def calc_ratios(x):
    #     cnt = Counter(
    #         {word: pd.np.log(counter / float((total_counts[word] - counter) + 1)) for word, counter in
    #          x.items()}).most_common()
    #
    #     return pd.Series({"ratio": cnt}, name='ratios')
    #
    #
    # ratios = counters.apply(calc_ratios)
