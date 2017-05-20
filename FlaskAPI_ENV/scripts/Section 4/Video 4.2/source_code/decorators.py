from functools import wraps
from flask import request
from flask import make_response


def validate_user(username, password):
    return username == "john" and password == "doe123"


def authenticate(func):
    @wraps(func)
    def decorated(*args, **kwargs):
        auth = request.authorization
        if not auth or not validate_user(auth.username, auth.password):
            resp = make_response("", 401)
            resp.headers["WWW-Authenticate"] = 'Basic realm="Login Required"'
            return  resp
        return func(*args, **kwargs)
    return decorated

