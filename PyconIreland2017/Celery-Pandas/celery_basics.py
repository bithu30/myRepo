import pickle
from collections import Counter

from celery import Celery

app = Celery("pycon", backend='rpc://', logging="info", broker='amqp://')
app.conf.update(CELERY_ACCEPT_CONTENT=['pickle', 'json'])


@app.task(name='pycon.add')
def add(*args):
    return sum(args)


@app.task(name='pycon.make_pi')
def make_pi(num_calcs):
    pi = 0.0
    for k in xrange(num_calcs):
        pi += 4 * ((-1) ** k / ((2.0 * k) + 1))
    return pi


@app.task(ignore_results=True)
def apply_function(func, data):
    return func(data)


@app.task()
def apply_counter(df):
    df = pickle.loads(df)
    return pickle.dumps(df.summary.apply(lambda x: Counter(str(x).split(" "))).values.sum())
