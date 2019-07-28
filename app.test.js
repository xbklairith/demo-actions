const app = require('./app');
const request = require('supertest');

describe('GET /', () => {
    afterAll(() => setTimeout(() => process.exit(), 1000))
    test('It should say hello', async (done) => {
        const result = await request(app).get('/');
        expect(result.text).toBe("Hello")
        done()
        // expect(moxios.requests.mostRecent().url).toBe('https://api.github.com/users/HugoDF');
      });

})