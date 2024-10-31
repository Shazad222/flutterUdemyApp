const mongoose = require("mongoose");

const productSchema = mongoose.Schema({
  productName: {
    type: String,
    trim: true,
    required: true,
  },
  productPrice: {
    type: Number,
    required: true,
  },
  quantity: {
    type: Number,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  subCategory: {
    type: String,
    required: true,
  },
  images: [{ type: String, required: true }],

  recommend: {
    type: Boolean,
    default: true,
  },

  popular: {
    type: Boolean,
    default: false,
  },
});

const Product = mongoose.model("Product", productSchema);

module.exports = Product;