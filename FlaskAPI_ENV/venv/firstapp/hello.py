from flask import  Flask

#creates an instance of the Flask object using our module's name as a parameter

app = Flask(__name__)

'''
Flask uses decorators for URL routing, so this line of code means that the function directly below
it should be called whenever a user visits the main root page of our web application
(which is defined by the single forward slash).

 Decorators call a function that takes the function defined under the decorator (in our case, index())
 and returns a modified function.
'''
@app.route("/")
def index():
    return "Hello World!"


if __name__ == '__main__':
    '''
    kicks off Flask's development server on our local machine. We set it to run on
    port 5000 (we'll use port 80 for production) and set debug to True,
    which will help us see detailed errors directly in our web browser.
    '''
    app.run(port=5000, debug=True)

