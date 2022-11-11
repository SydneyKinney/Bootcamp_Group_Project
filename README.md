# Google App Store Analysis

## Overview  
- Main topic: Number of installs vs price/ratings
- Why: We want to see if there is a correlation 
- Description of the source of data: This files contains Application data of more than 600K applications with the 23 attributes

#### Questions we hope to answer: 
- Does price/ratings affect installations? And in which way?
- What are the top 10 installed categories?
- What is the number of installs depending on the price (including ad support)?
- What is the number of installs depending on the rating (including ad support)?


## Process

#### Machine Learning Model Overview
- We originally planned to use Supervised learning with linear regression. However, linear regression had a very low score. We then tried RandomForrestRegressor300 and that produced a higher score. Therefore, we decided to use RandomForrestRegressor300 as our Machine Learning Model.

#### Machine Learning Model Details
- Description of data preprocessing: First, we dropped unnecessary columns. Then, we found nulls, NaN, and duplicates. We then formated the column headers and rows.  Finally, we made sure that all data was numeric.
- Description of feature engineering and the feature selection, including the decision-making process: We decided to leave the remaining columns and encode all of them in order to prepare for the machine learning.
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

#### Language
- Python

## Results
#### Rating Effect on Installations:

<img width="459" alt="Max Installs by Raiting" src="https://user-images.githubusercontent.com/107209737/201394685-7b18dee6-2111-4b1f-81df-ea6915ec99b2.png">

#### Top 10 Installed Categories:

<img width="1017" alt="Max Installs by Category" src="https://user-images.githubusercontent.com/107209737/201394637-33730fb3-4742-4d49-a761-8bdf2823ae65.png">

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
