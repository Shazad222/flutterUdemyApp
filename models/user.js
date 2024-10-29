const mongoose = require("mongoose");

// Define the user schema
const userSchema = new mongoose.Schema({
  fullName: {
    type: String,
    required: true, // Fixed spelling from 'require' to 'required'
    trim: true,
  },
  email: {
    type: String,
    required: true, // Fixed spelling from 'require' to 'required'
    trim: true,
    unique: true, // Ensure email is unique
    validate: {
      validator: (value) => {
        const result =
          /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return result.test(value); // Test if the email is valid
      },
      message: "Please enter a valid email", // Corrected error message for invalid emails
    },
  },
  state: {
    type: String,
    default: "",
  },
  city: {
    type: String,
    default: "",
  },
  locality: {
    type: String,
    default: "",
  },
  password: {
    type: String,
    required: true, // Fixed spelling from 'require' to 'required'
    validate: {
      validator: (value) => {
        return value.length >= 8; // Ensure password length is at least 8 characters
      },
      message: "Password must be at least 8 characters long",
    },
  },
});

// Create the User model
const User = mongoose.model("User", userSchema);

module.exports = User;
