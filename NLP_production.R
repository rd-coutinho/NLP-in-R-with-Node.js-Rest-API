# Making input available to R
# When evaluating a variable, R searches for it in the attached object.
attach(input[[1]])

# IMPORTING THE DATASET
dataset_original <- read.delim('Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)

# NEW REVIEW THAT WILL BE ADDED TO THE DATASET (new_review variable)
# new_review populated by the client (javascript)
dataset_original[nrow(dataset_original) + 1,] <- c(new_review, "")
dataset_original$Liked <- as.integer(dataset_original$Liked)

# CLEANING THE TEXTS
needs("tm")
needs("SnowballC")

corpus <- VCorpus(VectorSource(dataset_original$Review))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords())
corpus <- tm_map(corpus, stemDocument)
corpus <- tm_map(corpus, stripWhitespace)

# CREATING THE BAG OF WORDS MODEL
dtm <- DocumentTermMatrix(corpus)   # Sparse matrix of features
dtm <- removeSparseTerms(dtm, 0.999)

# BUILDING THE MACHINE LEARNING CLASSIFICATION MODEL (NAIVE BAYES, DECISION TREE OR RANDOM FOREST)
# Random Forest classification
dataset <- as.data.frame(as.matrix(dtm))
dataset$Liked <- dataset_original$Liked

# Encoding the target feature as factor
dataset$Liked <- factor(dataset$Liked, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
needs("caTools")

training_set <- dataset[-nrow(dataset),]
test_set <- dataset[nrow(dataset),]

#Fitting Random Forest classification to the Training Set
needs("randomForest")

classifier <- randomForest(x = training_set[-ncol(dataset)],
                          y = training_set$Liked,
                          ntree = 10)

# Predicting the Test set results
predict(classifier, newdata = test_set[-ncol(dataset)])
