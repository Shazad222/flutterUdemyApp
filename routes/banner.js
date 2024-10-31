// const express = require("express");
// const Banner = require("../models/banner");
// const bannerRouter = express.Router();

// // POST route to create a new banner
// bannerRouter.post("/api/banner", async (req, res) => {
//   try {
//     const { image } = req.body;

//     // Create a new instance of the Banner model
//     const banner = new Banner({ image });

//     // Save the new banner to the database
//     await banner.save();

//     // Respond with the created banner and status code 201
//     return res.status(201).send(banner);
//   } catch (error) {
//     // Handle any errors and respond with a status code 400
//     res.status(400).json({ error: error.message });
//   }
// });

// bannerRouter.get("/api/banner", async (req, res) => {
//   try {
//     const banners = await Banner.find();
//     await Banner.find();
//   } catch (error) {
//     res.status(500).json({ error: e.message });
//   }
// });
// module.exports = bannerRouter;

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

// GET route to fetch all banners
// bannerRouter.get("/api/banner", async (req, res) => {
//   try {
//     const banners = await Banner.find(); // Fetch all banners from the database
//     res.status(200).json(banners); // Send the banners as a JSON response
//   } catch (error) {
//     res.status(500).json({ error: error.message });
//   }
// });

bannerRouter.get("/api/banner", async (req, res) => {
  try {
    console.log("GET request received on /api/banner"); // Check if route is hit
    const banners = await Banner.find(); // Fetch all banners from the database
    console.log("Banners:", banners); // Log the result
    res.status(200).json(banners); // Send the banners as a JSON response
  } catch (error) {
    console.error("Error fetching banners:", error.message);
    res.status(500).json({ error: error.message });
  }
});

module.exports = bannerRouter;
