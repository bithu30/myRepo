from flask import Flask, jsonify
from quotes import funny_quotes
import random

app = Flask(__name__)

@app.route("/api/funny")
defserve_funny_qoute():
	quotes = funny_quotes()
	nr_of_quotes = len(quotes)
	selected_quote = quotes[random.randint(0, nr_of_quotes - 1)] 
	return jsonify(selected_quote)


if __name__ == "__main__":
	app.run(debug=True)