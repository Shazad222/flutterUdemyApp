const express = require("express");
const Banner = require("../models/banner");
const bannerRouter = express.Router();

// POST route to create a new banner
bannerRouter.post("/api/banner", async (req, res) => {
  try {
    const { image } = req.body;

    // Create a new instance of the Banner model
    const banner = new Banner({ image });

    // Save the new banner to the database
    await banner.save();

    // Respond with the created banner and status code 201
    return res.status(201).send(banner);
  } catch (error) {
    // Handle any errors and respond with a status code 400
    res.status(400).json({ error: error.message });
  }
});
