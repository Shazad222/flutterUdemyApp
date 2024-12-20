// const express = require("express");
// const SubCategory = require("../models/sub_category");
// const subCaategory = require("../models/sub_category");

// const subCategoryRouter = express.Router();

// subCategoryRouter.post("/api/subcategories", async (req, res) => {
//   try {
//     const { categoryId, categoryName, image, subCategoryName } = req.body;
//     const subcategory = new SubCategory({
//       categoryId,
//       categoryName,
//       image,
//       subCategoryName,
//     });
//     await subcategory.save();
//     res.status(201).send(subcategory);
//   } catch (error) {
//     res.status(500).json({ error: error.message });
//   }
// });

// subCategoryRouter.get(
//   "/api/subcategories/:categoryName/subcategories",
//   async (req, res) => {
//     try {
//       // extract the categoryName form the request Url using destructuring
//       const { categoryName } = req.params;

//       const subcategories = await SubCategory.find({
//         categoryName: categoryName,
//       });
//       if (!subcategories || subcategories.lenght === 0) {
//         return res.status(404).json({ msg: "subcategories not found" });
//       } else {
//         return res.status(200).json({ subCaategory });
//       }
//       // const subcategories = await SubCategory.find();
//       // res.status(200).json({ subcategories });
//     } catch (error) {
//       res.status(500).json({ error: e.message });
//     }
//   }
// );

// module.exports = subCategoryRouter;

const express = require("express");
const SubCategory = require("../models/sub_category");
const subCategoryRouter = express.Router();

// POST API to upload a subcategory
subCategoryRouter.post("/api/subcategories", async (req, res) => {
  try {
    const { categoryId, categoryName, image, subCategoryName } = req.body;

    // Create a new subcategory document
    const subcategory = new SubCategory({
      categoryId,
      categoryName,
      image,
      subCategoryName,
    });

    // Save subcategory to the database
    await subcategory.save();

    // Return the created subcategory as response
    res.status(201).json(subcategory);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
subCategoryRouter.get("/api/subcategories", async (req, res) => {
  try {
    const subcategories = await SubCategory.find();
    return res.status(200).json(subcategories);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
});

// GET API to fetch subcategories based on categoryName
subCategoryRouter.get(
  "/api/subcategories/:categoryName/subcategories",
  async (req, res) => {
    try {
      // Extract the categoryName from the request parameters
      const { categoryName } = req.params;

      // Fetch subcategories by categoryName from the database
      const subcategories = await SubCategory.find({ categoryName });

      // If no subcategories found
      if (!subcategories || subcategories.length === 0) {
        return res
          .status(404)
          .json({ msg: "No subcategories found for this category" });
      }

      // Return the list of subcategories as response
      res.status(200).json(subcategories);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
);

module.exports = subCategoryRouter;
