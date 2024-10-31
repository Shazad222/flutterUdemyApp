const express = require("express");
const SubCategory = require("../models/sub_category");
const subCaategory = require("../models/sub_category");

const subCategoryRouter = express.Router();

subCategoryRouter.post("/api/subcategories", async (req, res) => {
  try {
    const { categoryId, categoryName, image, subCategoryName } = req.body;
    const subcategory = new SubCategory({
      categoryId,
      categoryName,
      image,
      subCategoryName,
    });
    await subcategory.save();
    res.status(201).send(subcategory);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

subCategoryRouter.get(
  "/api/subcategories/:categoryName/subcategories",
  async (req, res) => {
    try {
      // extract the categoryName form the request Url using destructuring
      const { categoryName } = req.params;

      const subcategories = await SubCategory.find({
        categoryName: categoryName,
      });
      if (!subcategories || subcategories.lenght === 0) {
        return res.status(404).json({ msg: "subcategories not found" });
      } else {
        return res.status(200).json({ subCaategory });
      }
      // const subcategories = await SubCategory.find();
      // res.status(200).json({ subcategories });
    } catch (error) {
      res.status(500).json({ error: e.message });
    }
  }
);

module.exports = subCategoryRouter;
