import app
import unittest
import json

class AppTestCase(unittest.TestCase):
    def setUp(self):
        print("==> Setting up the env for tests!")
        app.app.config['TESTING'] = True
        self.app = app.app.test_client()

    def tearDown(self):
        print("==> Tearing down after tests!")

    def test_index(self):
        resp = self.app.get('/')
        assert "200 OK" == resp.status
        assert "Web API Development with Flask" in resp.data

    def test_api_candidate_by_id(self):
        resp = self.app.get('/api/candidates')
        tmp_data = json.loads(resp.data)
        assert 8 == len (tmp_data['candidates'])

if __name__ == '__main__':
    unittest.main()
