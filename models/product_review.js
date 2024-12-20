const mongoose = require("mongoose");

const ProductReviewSchema = new mongoose.Schema({
  buyerId: {
    // Changed from byerId to buyerId
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
  },
  fullName: {
    type: String,
    required: true,
  },
  productId: {
    type: String,
    required: true,
  },
  rating: {
    type: Number,
    required: true,
  },
  review: {
    type: String,
    required: true,
  },
});

const ProductReview = mongoose.model("ProductReview", ProductReviewSchema);

module.exports = ProductReview;
