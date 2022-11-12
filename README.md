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
- We originally planned to use Supervised learning with linear regression. However, linear regression had a very low score. We then tried RandomForrestRegressor300 and that produced a higher score. Therefore, we decided to use RandomForrestRegressor300 as our Machine Learning Model.

#### Machine Learning Model Details
- Any type of machine learning involves data preparation since it needs precise numerical data. Having said that, we began by removing the columns, which will not have an impact for training purposes. Then we checked if data has any nulls and duplicates and it did, so we removed it too.
The biggest challenge was to transform column Size to a numerical value: before it had a string like 10M or 1000k, for example and we decided to make it a float value with relevant to its meaning data. Therefore, we created a function with IF statement, which would iterate through all the rows and replace each string with number using a formula to remove the suffix from the end of the string and multiply the value by mathematical number to transform it to a precise value. 
![Screenshot 2022-11-12 at 11 50 23 AM](https://user-images.githubusercontent.com/105990653/201492040-2bf89f81-21c3-4f1a-b114-55d264f24d8b.png)

For the columns which contained Booleans we used another function to iterate through each row and change type Boolean to type Integer.

![Screenshot 2022-11-12 at 11 52 10 AM](https://user-images.githubusercontent.com/105990653/201492094-2548754a-4fb8-4251-aa1f-ec0c5c134a0a.png)

And for the last one is “Content Rating” column, which contains String value too we used a get_dummies function to convert a categorical data into dummy or indicator variables and assigning one binary column per categorical feature.

![Screenshot 2022-11-12 at 11 53 31 AM](https://user-images.githubusercontent.com/105990653/201492151-a162c21b-6662-4795-ac92-d303f1213206.png)

- The next step was feature engineering, which was difficult because we had to look at new ways to choose which columns to keep for machine learning. Because the goal of this machine learning model is to forecast whether any data variables have an impact on the quantity of installations of the App in the Google Store, we chose the "Maximum Installs" column as our target value.
Knowing that our data was essentially clean and had been converted to a numerical format, we chose to use Backwards Elimination to select a subset of explanatory variables for the model. As a result of the selective process, we created an OLS table which shows P-value of each column respectively. 

![Screenshot 2022-11-12 at 11 56 58 AM](https://user-images.githubusercontent.com/105990653/201492273-1419be88-bbd3-4712-ba90-3ac8f886a433.png)

It helped us to determine with columns to remove from features that do not have a significant effect on the dependent variable or prediction of output.

- Description of how data was split into training and testing sets: 
<img width="755" alt="split_train_test" src="https://user-images.githubusercontent.com/105990653/201261034-f5222b12-2644-49a4-b2cc-0f3e06109643.png">

- Explanation of model choice, including limitations and benefits: Our main question was about continuous values (Maximum Installs), so a supervised learning and a regression model was the best choice. We tried the Linear Regression model and that produced a very low score, which means that our data was not so linear. Therefore, we tried the Random Forest Regressor model (with 300 decision trees) and that model showed a higher score.
- Explanation of changes in model choice (if changes occurred between the Segment 2 and Segment 3 deliverables): In the begining of the modeling, we thought that Linear Regression would show better results, but it did not so we tried Random Forest instead which showed better results.
- Description of how they have trained the model thus far, and any additional training that will take place: We utilized the sklearn.model_selection train_test_split function for our training purposes.
- Description of current accuracy score: below is an image of the scores from each model we tried.
<img width="316" alt="DataFrame" src="https://user-images.githubusercontent.com/105990653/201264320-04b82b05-b613-469f-8114-1a307633b225.png">


#### Database 
- AWS
- pgAdmin
- postgreSQL

#### Language
- Python
- SQL

## Results
#### Rating Effect on Installations:

<img width="459" alt="Max Installs by Raiting" src="https://user-images.githubusercontent.com/107209737/201394685-7b18dee6-2111-4b1f-81df-ea6915ec99b2.png">

#### Top 10 Apps That Have the Most Installs:

![Top 10 Average Rating Count per Category (2)](https://user-images.githubusercontent.com/107209737/201441216-49c0ce2d-612c-495c-adf6-2696366b11dc.png)

#### Number of Installs Depending on Price (including ad support):

![Max installs by Price (2)](https://user-images.githubusercontent.com/107209737/201439345-68b323aa-7163-409b-b2d9-ef28d5df5371.png)

#### Number of Installs Depending on Rating of App (including ad support):

![Max Installs by Rating](https://user-images.githubusercontent.com/107209737/201439330-b3a78c89-77d3-4f74-8f3a-8784f662649c.png)

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
