const express = require("express");
const ProductReview = require("../models/product_review");
const productReviewRouter = express.Router();

productReviewRouter.post("/api/product-review", async (req, res) => {
  try {
    const { buyerId, email, fullName, productId, rating, review } = req.body;
    const newReview = new ProductReview({
      buyerId,
      email,
      fullName,
      productId,
      rating,
      review,
    });
    await newReview.save();
    res
      .status(201)
      .send({ message: "Product review created successfuly", newReview });
  } catch (error) {
    console.log("error creatingproduct review:", error);
    res
      .status(500)
      .json({ message: "Failed to create product review", error: message });
  }
});

productReviewRouter.get("/api/reviews", async (req, res) => {
  try {
    // Fetch all reviews from MongoDB
    const reviews = await ProductReview.find();

    // Send the reviews as a JSON response
    return res.status(200).json(reviews);
  } catch (error) {
    console.log("Error fetching product reviews:", error);
    res.status(500).json({
      message: "Failed to fetch product reviews",
      error: error.message,
    });
  }
});

module.exports = productReviewRouter;
