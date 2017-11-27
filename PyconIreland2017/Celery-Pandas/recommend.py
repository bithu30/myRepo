import pandas as pd
import numpy as np


def cos_sim(a, b):
    dot_product = np.dot(a, b)
    norm_a = np.linalg.norm(a)
    norm_b = np.linalg.norm(b)
    return dot_product / (norm_a * norm_b)


def recommend_with_pearsonR(ratings_pivot, df, productID):
    average_rating = pd.DataFrame(df.groupby('productID')['ratings'].mean())
    average_rating['ratingCount'] = pd.DataFrame(df.groupby('productID')['ratings'].count())
    average_rating.sort_values('ratingCount', ascending=False).head()
    assasing_creed_ratings = ratings_pivot[productID]
    similar2video_games = ratings_pivot.corrwith(assasing_creed_ratings)
    corr_assasin_creed = pd.DataFrame(similar2video_games, columns=['pearsonR']).dropna()
    corr_summary = corr_assasin_creed.join(average_rating['ratingCount'])
    corr_summary[corr_summary['ratingCount'] >= 5].sort_values('pearsonR', ascending=False).head(10)
    return corr_summary[corr_summary['ratingCount'] >= 5].sort_values('pearsonR', ascending=False).head(
        10).index.tolist()


def recommend_with_cosine_similarity(ratings_pivot):
    ratings_pivot.fillna(0, inplace=True)

    similarity_matrix = pd.DataFrame(index=ratings_pivot.columns, columns=ratings_pivot.columns,
                                     data=cos_sim(ratings_pivot.T, ratings_pivot))

    return similarity_matrix
