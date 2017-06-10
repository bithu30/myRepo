from flask import Flask
import  feedparser

app = Flask(__name__)

BBC_FEED = "http://feeds.bbci.co.uk/news/rss.xml"

RSS_FEEDS = {'bbc': 'http://feeds.bbci.co.uk/news/rss.xml',
             'cnn': 'http://rss.cnn.com/rss/edition.rss',
             'fox': 'http://feeds.foxnews.com/foxnews/latest',
             'iol': 'http://www.iol.co.za/cmlink/1.640'}

'''
In Flask, if we specify a part of our URL path in angle brackets < >,
then it is taken as a variable and is passed to our application code. Therefore, we can go back to having a single
get_news() function and pass in a <publication> variable'''

@app.route("/")
@app.route("/<pub>")
def get_news(pub="bbc"):
    feeds = feedparser.parse(RSS_FEEDS[pub])
    first_article = feeds['entries'][0]
    return """
    <html>
    <body>
    <h1>Headlines</h1>
    <b>{0}</b></br>
    <b>{1}</b></br>
    <b>{2}</b></br>
    </body>
    </html>
    """.format(first_article.get('title'),first_article.get('published'),first_article.get('summary'))

if __name__ == '__main__':
    app.run(port=4567,debug=True)