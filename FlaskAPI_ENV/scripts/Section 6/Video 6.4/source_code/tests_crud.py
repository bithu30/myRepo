import app
import unittest
import json

class CRUDTestCase(unittest.TestCase):

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
        assert 10 < len (tmp_data['candidates'])

    def test_create(self):
        print("\nRunning: test_create")
        resp = self.app.post('/api/candidates',data = dict(
            first_name = "Tester",
            last_name = "Auto",
            email = "auto@tester.com",
            phone = "123-654-987"
        ))
        tmp_data = json.loads(resp.data)
        assert tmp_data["id"] is not None
        assert tmp_data["url"] is not None
        self.my_test_read(tmp_data["id"])


    def my_test_read(self, id):
        print("\nRunning: my_test_read")

        resp = self.app.get('/api/candidates/' + str(id),
                            headers={"MY_AUTH_TOKEN":"81c4e12b6879000837a3e7206795ee9ca874986cc97984d383c64093f5cc352d"})
        tmp_candidate = json.loads(resp.data)
        canidate = tmp_candidate["candidate"][0]

        assert canidate is not None
        assert "Tester" == canidate["first_name"]
        assert "Auto" == canidate["last_name"]
        assert "auto@tester.com" == canidate["email"]


    def test_delete(self, id=31):
        print("\nRunning: test_delete")
        resp = self.app.delete('/api/candidates/'+str(id))
        assert 200 == resp.status_code




if __name__ == '__main__':
    unittest.main()
