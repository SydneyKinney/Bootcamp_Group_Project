# Google App Store Analysis

## Overview  
- Main topic: Number of installs vs price/ratings
- Why: We want to see if there is a correlation 
- Description of the source of data: This files contains Application data of more than 600K applications with the 23 attributes

#### Questions we hope to answer: 
- Does price/ratings affect installations? And in which way?
- What are the top 10 categories?
- What are the top 10 installed categories?
- What is the number of downloads depending on the price?
- Does ad support have a impact on the rating of the app?
- What impact does reviews have on installs?

## Process

#### Machine Learning Model Overview
- We originally planned to use Supervised learning with linear regression. However, linear regression had a very low score. We then tried RandomForrestRegressor300 and that produced a higher score. Therefore, we decided to use RandomForrestRegressor300 as our Machine Learning Model.

#### Machine Learning Model Details
- Description of data preprocessing: First we dropped unnecessary columns, then nulls and NaN and duplicates. Then we formated the column headers and rows.  And finally we made sure that all data was numeric.
- Description of feature engineering and the feature selection, including the decision-making process: We decided to leave the remaining columns for features columns and encoded all of them in order to prepare for the machine learning.
- Description of how data was split into training and testing sets: <img width="755" alt="split_train_test" src="https://user-images.githubusercontent.com/105990653/201261034-f5222b12-2644-49a4-b2cc-0f3e06109643.png">

- Explanation of model choice, including limitations and benefits: because our question is a regression problem we had to choose frorm regression ML models. We tried the Linear Regression model and Random Forest Regressor (with 300 dessision trees) model and last one showed the best results.
- Explanation of changes in model choice (if changes occurred between the Segment 2 and Segment 3 deliverables): In the begining of the modeling we thought that Linear Regression would show better results, but did not do it so we tried Random Forest insted.
- Description of how they have trained the model thus far, and any additional training that will take place: We utilized the sklearn.model_selection train_test_split function for our training purposes.
- Description of current accuracy score.: the scores we got you can see in the following DataFrame 
<img width="316" alt="DataFrame" src="https://user-images.githubusercontent.com/105990653/201264320-04b82b05-b613-469f-8114-1a307633b225.png">


#### Database 
- AWS
- pgAdmin

#### Language
- Python

## Results

## Summary

## Links

#### Google Slides
https://docs.google.com/presentation/d/1o8UILo1VpHJlNcD0_tMlmD5RyWv_ONd3PsxXDaaWKyk/edit?usp=sharing

#### Tableau
https://public.tableau.com/app/profile/elena4442/viz/Bootcamp_Group_Projuct/MaxInstallsRatingCountbyCategory?publish=yes

#### Dataset
https://www.kaggle.com/datasets/gauthamp10/google-playstore-apps
