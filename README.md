# Google App Store Analysis

## Overview  
- Main topic: Number of installs vs price/ratings.
- Why: We want to see if there is a correlation. 
- Description of the source of data: This files contains Application data of more than 600K applications with the 23 attributes.

#### Questions we hope to answer: 
- Does price/ratings affect installations? And in which way?
- What are the top 10 apps that have the most installs?
- What is the number of installs depending on the price (including ad support)?
- What is the number of installs depending on the rating (including ad support)?


## Process

#### Machine Learning Model Overview
- We originally planned to use Supervised learning with linear regression. However, linear regression had a very low score. We then tried Random Forrest models and that produced a higher score. Therefore, we decided to use Random Forrest Regressor as our Machine Learning Model.

#### Machine Learning Model Details
- Any type of machine learning involves data preparation since it needs precise numerical data. Having said that, we began by removing the columns, which will not have an impact for training purposes. Then we checked if data has any nulls and duplicates and it did, so we removed it too.
The biggest challenge was to transform column Size to a numerical value: before it had a string like 10M or 1000k, for example and we decided to make it a float value with relevant to its meaning data. Therefore, we created a function with IF statement, which would iterate through all the rows and replace each string with number using a formula to remove the suffix from the end of the string and multiply the value by mathematical number to transform it to a precise value. 

![Screenshot 2022-11-12 at 11 50 23 AM](https://user-images.githubusercontent.com/105990653/201492040-2bf89f81-21c3-4f1a-b114-55d264f24d8b.png)

 For the columns which contained Booleans we used another function to iterate through each row and change type Boolean to type Integer.

![Screenshot 2022-11-12 at 11 52 10 AM](https://user-images.githubusercontent.com/105990653/201492094-2548754a-4fb8-4251-aa1f-ec0c5c134a0a.png)

 And for the last one is “Content Rating” column, which contains String value too we used a get_dummies function to convert a categorical data into dummy   or indicator variables and assigning one binary column per categorical feature.

![Screenshot 2022-11-12 at 11 53 31 AM](https://user-images.githubusercontent.com/105990653/201492151-a162c21b-6662-4795-ac92-d303f1213206.png)

- The next step was feature engineering, which was difficult because we had to look at new ways to choose which columns to keep for machine learning. Because the goal of this machine learning model is to forecast whether any data variables have an impact on the quantity of installations of the App in the Google Store, we chose the "Maximum Installs" column as our target value.
Knowing that our data was essentially clean and had been converted to a numerical format, we chose to use Backwards Elimination method to select a subset of explanatory variables for the model. As a result of the selective process, we created an OLS table which shows P-value of each column respectively. 

![Screenshot 2022-11-12 at 11 56 58 AM](https://user-images.githubusercontent.com/105990653/201492273-1419be88-bbd3-4712-ba90-3ac8f886a433.png)

 It helped us to determine with columns to remove from features that do not have a significant effect on the dependent variable or prediction of output.

- Description of how data was split into training and testing sets: 
<img width="755" alt="split_train_test" src="https://user-images.githubusercontent.com/105990653/201261034-f5222b12-2644-49a4-b2cc-0f3e06109643.png">

- Our main question was about continuous values (Maximum Installs), so a supervised learning and a regression model was the best choice. 
First, we tried the Linear Regression model, which is easier to implement, interpret and efficient to train, but the model produced a very low score. By its nature, linear regression only looks at linear relationships between dependent and independent variables. That is, it assumes there is a straight-line relationship between them. It shows that in our dataset this is incorrect.

- Then we decided to try a Random Forest model instead as it produces good predictions that can be understood easily. It can handle large datasets efficiently, which we have. The random forest algorithm provides a higher level of accuracy in predicting outcomes over the decision tree algorithm.
Therefore, we tried the Random Forest Regressor model (with 100 decision trees and tree depth of 8) and that model showed a higher score, but looks like the model is overfitted as training score is much higher than a test score. This is why we decided to try same Random Forest Regressor model but with 50 decision trees and depth of the tree 3 and this model has a little higher score. The main limitation of random forest is that a large number of trees can make the algorithm too slow and ineffective for real-time predictions. In general, these algorithms are fast to train, but have a drawback - it is quite slow to create predictions once they are trained.

- Before we trained our dataset, we created a list where we defined the models we are going to use and created an empty list for results of the model. 
then we developed a function for training the models that would use all the models we defined, train the data, and append the results to the list we had already generated.

- Below is an image of the scores from each model we tried:

![Screenshot 2022-11-14 at 10 47 03 AM](https://user-images.githubusercontent.com/105990653/201741140-cbab5bba-ab51-47f4-8d41-98dbeb45de48.png)


#### Database 
- AWS
- pgAdmin
- postgreSQL

#### Language
- Python
- SQL

## Results
#### Rating Effect on Installations:

![Installs   Rating Count by Category](https://user-images.githubusercontent.com/107209737/201786839-b0ab3809-9c6e-4d4c-bddd-9223dc011e7a.png)

#### Top 10 Apps That Have the Most Installs:

![Top 10 Apps by Installs](https://user-images.githubusercontent.com/107209737/201786573-5ba53235-930b-4f32-8aab-29734ed2b87b.png)

#### Number of Installs Depending on Price (including ad support):

![Installs by Price](https://user-images.githubusercontent.com/107209737/201786705-556b6ae7-4137-4f5e-a510-832072c8169b.png)

#### Number of Installs Depending on Rating of App (including ad support):

![Installs by Raiting](https://user-images.githubusercontent.com/107209737/201786784-467ab94e-a4cf-4122-8eee-bcae9cb67d42.png)

## Summary
- The price of an app does have an affect on installation.
- The rating of an app does have an affect on installation. 
- There are more downloads for free apps versus apps that users have to pay for.

## Links

#### Google Slides
https://docs.google.com/presentation/d/1o8UILo1VpHJlNcD0_tMlmD5RyWv_ONd3PsxXDaaWKyk/edit?usp=sharing

#### Tableau
https://public.tableau.com/app/profile/elena4442/viz/Bootcamp_Group_Projuct/MaxInstallsRatingCountbyCategory?publish=yes

#### Dataset
https://www.kaggle.com/datasets/gauthamp10/google-playstore-apps
