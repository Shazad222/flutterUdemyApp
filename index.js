// // // Define the port number
// // const PORT = 3000;

// // // Import the express module
// // const express = require("express");
// // const helloRoute = require("./routes/auth"); // Correct path to hello.js
// // const mongoose = require("mongoose");
// // const authRouter = require("./routes/auth");

// // // Create an instance of an express application
// // const app = express();

// // // MongoDB connection string
// // const DB = "mongodb+srv://shahzad:Swabi$222@cluster0.gcnza.mongodb.net/";

// // // // Middleware to register routes
// // app.use(express.json());
// // app.use(authRouter);

// // // // Connect to MongoDB
// // mongoose
// //   .connect(DB)
// //   .then(() => {
// //     console.log("MongoDB Connected");
// //   })
// //   .catch((error) => {
// //     console.error("MongoDB Connection Error:", error);
// //   });

// // // Start the server and listen on the defined port
// // app.listen(PORT, "0.0.0.0", function () {
// //   console.log(`Server is running on port ${PORT}`);
// // });

// // Define the port number
// const PORT = 3000;

// // Import the express module
// const express = require("express");
// const mongoose = require("mongoose");
// const authRouter = require("./routes/auth"); // Ensure correct import

// // Create an instance of an express application
// const app = express();

// // MongoDB connection string
// const DB = "mongodb+srv://shahzad:Swabi$222@cluster0.gcnza.mongodb.net/";

// // Middleware to parse JSON data
// app.use(express.json());

// // Register auth routes
// app.use(authRouter);

// // Connect to MongoDB
// mongoose
//   .connect(DB)
//   .then(() => {
//     console.log("MongoDB Connected");
//   })
//   .catch((error) => {
//     console.error("MongoDB Connection Error:", error);
//   });

// // Start the server and listen on the defined port
// app.listen(PORT, "0.0.0.0", function () {
//   console.log(`Server is running on port ${PORT}`);
// });



const PORT = 3000;

// Import the express module
const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth"); // Ensure correct import

// Create an instance of an express application
const app = express();

// MongoDB connection string (ensure your password is URL-encoded and database name is specified)
const DB = "mongodb+srv://shahzad:Swabi$222@cluster0.gcnza.mongodb.net/myDatabase?retryWrites=true&w=majority";

// Middleware to parse JSON data
app.use(express.json());

// Register auth routes
app.use(authRouter);

// Connect to MongoDB
mongoose
  .connect(DB, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("MongoDB Connected");
  })
  .catch((error) => {
    console.error("MongoDB Connection Error:", error);
  });

// Start the server and listen on the defined port
app.listen(PORT, "0.0.0.0", function () {
  console.log(`Server is running on port ${PORT}`);
});
