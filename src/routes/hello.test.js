const request = require("supertest");

const app = require("../app");

test("GET /", async () => {
  const res = await request(app).get("/");
  expect(res.statusCode).toBe(200);
  expect(res.body).toEqual("Hello world!");
});
