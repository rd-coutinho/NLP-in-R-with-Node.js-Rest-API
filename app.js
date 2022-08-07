// Importing the necessary modules
const express = require('express')
const { classifica } = require("./predict")

// Express application instance
const app = express()

// Add the JSON plugin to handle JSON requests
app.use(express.json())

// Create a post route to predict the data
app.post('/predict', classifica)

console.log("App running on port 9000")
app.listen(9000)