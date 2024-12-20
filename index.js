const PORT = 3000;

// Import the express module
const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth"); // Ensure correct import
const bannerRouter = require("./routes/banner");
const categoryRouter = require("./routes/category");
const productRouter = require("./routes/product");
const subcategoryRouter = require("./routes/sub_category");
const productReviewRouter = require("./routes/product_review");
const cors = require("cors");

// Create an instance of an express application
const app = express();

// MongoDB connection string (ensure your password is URL-encoded and database name is specified)
const DB =
  "mongodb+srv://shahzad:Swabi$222@cluster0.gcnza.mongodb.net/myDatabase?retryWrites=true&w=majority";

// Middleware to parse JSON data
app.use(express.json());
app.use(cors());// enable cors for all route and origins

// Register auth routes
app.use(authRouter);
app.use(bannerRouter);
app.use(categoryRouter);
app.use(subcategoryRouter);
app.use(productRouter);
app.use(productReviewRouter);
// Connect to MongoDB

mongoose
  .connect(DB, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("MongoDB Connected");
  })
  .catch((error) => {
    console.error("MongoDB Connection Error:", error);
  });

// Start the server and listen on the defined port
app.listen(PORT, "0.0.0.0", function () {
  console.log(`Server is running on port ${PORT}`);
});
