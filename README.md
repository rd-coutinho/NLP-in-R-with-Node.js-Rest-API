A Rest API in Node.js with Express developed to run a NLP (Natural Language Processing) classifier. The model is based on a dataset of 1000 restaurant reviews labeled as either 0 (a negative review) or 1 (positive review) trained considering the bag of words model transforming each review in order the supervised machine learning algorithm to capture the correlations between words (to lower case, removing numbers, punctuation, stopwords, stemming and so on) and make the prediction. 

The model was created in R building a Random Forest algorithm integrated with Node.js to have a Rest API with R-Script data.

## GET
Return the machine lerning classification as being 0 (negative review) or 1 (positive review).

## POST
Requires a JSON content, like below

{<br/>
  "new_review": "I really love this restaurant!!!"<br/>
}

## Example
![](Integration_Node_js_and_R.gif)

In this example, we write a positive review as a JSON Content and make a POST request, getting a response from the prediction made by algorithm (correctly predicted as 1, being a positive review).

## Installation
With Node.js already installed, execute the commands below to download and install the dependencies and run the app: 

npm install express -save<br/>
npm install r-script --save<br/>
Or npm install to install all dependencies used in this project.

node app.js

## R Packages
All the necessary R packages used to build the model:

install.packages('tm')<br/>
install.packages('SnowballC')<br/>
install.packages('caTools')<br/>
install.packages('randomForest')
