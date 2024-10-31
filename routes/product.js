const express = require("express");
const Product = require("../models/product");
const productRouter = express.Router();

productRouter.post("/api/add-product", async (req, res) => {
  try {
    // Destructure request body to get  dproduct details
    const {
      productName,
      productPrice,
      quantity,
      description,
      category,
      subCategory,
      images,
    } = req.body;

    // Create a new Product instance
    const product = new Product({
      productName,
      productPrice,
      quantity,
      description,
      category,
      subCategory,
      images,
    });

    // Save the product to the database
    await product.save();

    // Send a successful response with the created product
    res.status(201).json(product);
  } catch (error) {
    // Handle any errors and send a 500 response
    res.status(500).json({ error: error.message });
  }
});

//
// productRouter.get("/api/add-product", async (req, res) => {
//   try {
//     // Fetch all products from the database
//     // const products = await Product.find({});

//     const images = await Product.find({}, "images");
//     // Send the products as a response
//     res.status(200).json(images);
//   } catch (error) {
//     // Handle errors and send a 500 response with error message
//     res.status(500).json({ error: error.message });
//   }
// });

productRouter.get("/api/add-product", async (req, res) => {
  try {
    // Fetch all products from the database
    const products = await Product.find({ recommend: false });

    //   const images = await Product.find({}, "images");
    // Send the products as a response
    res.status(200).json(products);
  } catch (error) {
    // Handle errors and send a 500 response with error message
    res.status(500).json({ error: error.message });
  }
});

module.exports = productRouter;
