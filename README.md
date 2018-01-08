### This file explains how does the run_analysis.R script operate to analyse Samsung data to produce a tidy data set

# Step 1 : Loading files into the memory
  xtest and xtrain are loaded as data tables
  Activity labels are also loaded

# Step 2: Adding activity labels to activity IDs
  Merge test and train activity IDs with activity label names to generate ytest and ytrain

# Step 3: Adding subject ID column
  Load subject data for test and train, and add a new column "subject" to xtest and xtrain

# Step 4: Adding activity labels
  Create a second column "activity" in xtest and xtrain data tables, which contains activity label name

# Step 5: Reorder columns and final merge
  Reorder columns in xtest and xtrain, to put respectively "subject" and "activity" in the 1st and 2nd positions
  Merge xtest and xtrain to create DataSet
  DataSet is ordered by Subject ID
  Name DataSet columns, using data from the "features.txt" file.

# Step 6: Extract mean and Standard deviation columns
  From 561 variables, we exctract only variables for mean and standard deviation
  The script search for matches accross the variables, using grep command and "mean|std" pattern
  The result is stored in DataSet2

# Step 7: Produce the tidy data
  Use aggregate function to order DataSet2, applying the mean function to average variables by activity & subject
  Sort the results (tidydata) by activity name and subject ID
  
  
  
  
  



