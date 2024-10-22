

const express = require("express");
const User = require("../models/user");
const { compare } = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authRouter = express.Router();

// Signup route
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { fullName, email, password } = req.body;

    if (!fullName || !email || !password) {
      return res.status(400).json({ msg: "Please fill in all fields" });
    }

    // Check if a user with the same email already exists
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with the same email already exists" });
    }

    // Create a new user with the provided information
    const newUser = new User({ fullName, email, password });
    const savedUser = await newUser.save();

    // Respond with the saved user
    res.json({ user: savedUser });
  } catch (error) {
    console.error(error); // Log the error for debugging
    res.status(500).json({ error: error.message });
  }
});


authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    // Log the email received for debugging
    console.log("Email received for sign-in:", email);

    // Find the user by email (case-insensitive)
    const findUser = await User.findOne({
      email: new RegExp(`^${email}$`, "i"),
    });

    // Log user information for debugging
    console.log("User found:", findUser);

    if (!findUser) {
      return res.status(400).json({ msg: "User not found with this email" });
    }

    // Compare the provided password with the plain text password in the database
    if (password !== findUser.password) {
      return res.status(400).json({ msg: "Incorrect Password" });
    }

    // Generate a JWT token
    const token = jwt.sign({ id: findUser._id }, "PasswordKey");

    // Remove sensitive information (password) from the user object
    const { password: _, ...userWithoutPassword } = findUser._doc;

    // Send the response with the token and user info (without password)
    res.json({ token, ...userWithoutPassword });
  } catch (error) {
    console.error("Error during sign-in:", error); // Log the error for debugging
    res.status(500).json({ error: error.message });
  }
});

module.exports = authRouter;
