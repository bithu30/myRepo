import app
import unittest
import json

class AuthenticationTestCase(unittest.TestCase):

    def setUp(self):
        app.app.config['TESTING'] = True
        self.app = app.app.test_client()

    def tearDown(self):
        pass







    def test_api_authorization(self):
        print("\nRunning: test_api_authorization")
        resp = self.app.get('/about',
                            headers={"Authorization":"Basic a2VubzpidXR0ZXI="})
        assert 200 == resp.status_code

        assert "About the Sample Application" in resp.data





    def test_api_authorization_FAIL(self):
        print("\nRunning: test_api_authorization_FAIL")
        resp = self.app.get('/about',
                            headers={"Authorization":"Basic TEST"})

        assert 401 == resp.status_code
        assert 'Basic realm="Login Required"' == resp.headers["WWW-Authenticate"]









if __name__ == '__main__':
    unittest.main()
