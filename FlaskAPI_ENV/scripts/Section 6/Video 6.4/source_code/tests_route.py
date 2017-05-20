import app
import unittest
import json

class RoutesTestCase(unittest.TestCase):

    def setUp(self):
        app.app.config['TESTING'] = True
        self.app = app.app.test_client()

    def tearDown(self):
        pass

    def test_api_candidate_OK(self):
        print("\nRunning: test_api_candidate_OK")
        resp = self.app.get('/api/candidates')
        tmp_data = json.loads(resp.data)
        # we have 8 candidates
        assert 8 == len (tmp_data['candidates'])

    def test_api_candidate_by_id_OK(self):
        print("\nRunning: test_api_candidate_by_id_OK")
        resp = self.app.get('/api/candidates/5',
                            headers={"MY_AUTH_TOKEN":"81c4e12b6879000837a3e7206795ee9ca874986cc97984d383c64093f5cc352d"})
        tmp_data = json.loads(resp.data)

        canidate = tmp_data["candidate"][0]

        assert canidate is not None
        assert "Johnny" == canidate["first_name"]
        assert 5 == canidate["id"]

    def test_api_candidate_by_id_FAIL(self):
        print("\nRunning: test_api_candidate_by_id_FAIL")
        resp = self.app.get('/api/candidates/5',
                            headers={"MY_AUTH_TOKEN":"INVALID"})

        assert 401 == resp.status_code
        assert "9500" == resp.headers["X-APP-ERROR-CODE"]
        assert "No valid authentication token found in request" == resp.headers["X-APP-ERROR-MESSAGE"]


if __name__ == '__main__':
    unittest.main()
