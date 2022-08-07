A Rest API in Node.js with Express developed to run a NLP (Natural Language Processing) classifier. The model is based on a dataset of 1000 restaurant reviews labeled as either 0 (a negative review) or 1 (positive review) trained considering the bag of words model transforming each review in order the supervised machine learning algorithm to capture the correlations between words (to lower case, removing numbers, punctuation, stopwords, stemming and so on) and make the prediction. 

The model was created in R building a Random Forest algorithm integrated with Node.js to have a Rest API with R-Script data.

## GET
Return the machine lerning classification as being 0 (negative review) or 1 (positive review).

## POST
Requires a JSON content, like below

{
  "new_review": "That was really fantastic!!!"
}

## Example


## Installation
With Node.js already installed, execute the commands below to download the dependencies and run the app: 

npm install express -save
npm install r-script --save

node app.js

## R Packages
All the necessary R packages used to build the model:

install.packages('tm')
install.packages('SnowballC')
install.packages('caTools')
install.packages('randomForest')
