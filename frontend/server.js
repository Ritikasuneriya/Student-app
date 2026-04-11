const express = require("express");
const bodyParser = require("body-parser");
const axios = require("axios");
const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");

app.get("/", (req, res) => {
  res.render("index");
});

app.post("/submit", async (req, res) => {
  try {
    const response = await axios.post("http://backend:5000/register", req.body);
    res.render("success", { message: response.data.message });
  } catch (err) {
    res.send("Error submitting form");
  }
});

app.listen(3000, () => {
  console.log("Frontend running on http://localhost:3000");
});