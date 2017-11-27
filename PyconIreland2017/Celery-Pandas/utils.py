import string
from collections import Counter

import pandas as pd

filter_punctuations = lambda text: "".join(list(filter(lambda x: x not in string.punctuation, str(text))))


def clean_text(df, fieldname):
    df[fieldname] = df[fieldname].str.lower()
    df[fieldname] = df[fieldname].apply(filter_punctuations)
    df.dropna(subset=[fieldname], inplace=True)
    return df


def calc_ratios(x, total_counts):
    cnt = Counter(
        {word: pd.np.log(counter / float((total_counts[word] - counter) + 1)) for word, counter in
         x.items()}).most_common(10)
    return pd.Series(cnt, name='ratios')
