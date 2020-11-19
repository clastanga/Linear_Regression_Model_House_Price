# Predict the price of a house with a linear regression model

This project is part of my training in Data Anlytics and was conducted as midterm individual project.

#### -- Project Status: [Completed]

## Project 
## Scenario 
A company wants to build a machine learning model to predict the selling prices of houses based on a variety of features on which the value of the house is evaluated.

## Objective 
Your job is to build a model that will predict the price of a house based on features provided in the dataset. 
Senior management also wants to explore the characteristics of the houses using some business intelligence tools. 
One of those parameters includes understanding which factors are responsible for higher property value - $650K and above.


### Methods Used
* Statistics
* Machine Learning/Predictive Modeling
* Data Visualization
* Database querying language

### Tools 
* Python/Pandas/Numpy/Scipy/Sklearn/Seaborn/Matplotlib
* Tableau 
* MySQL/Sequel Pro

## Workflow
- I began by examining the dataset using Pandas. The dataset didn't required many manipulations, as it didn't have any missing values. Moreover the dataset didn't contain any categorical values, but numericals.
- As the dataset was very large, I used MySQL to have a better understanding of the content of the dataset. 
- Back on my jupyter notebook, using the statistic libraries of Python, I looked into descriptive statistics, checking for multicollinearity and variables distribution and visualisation with seaborn and matplotlib to choose the features for my model.

- First iteration: trial attempt. Application of the linear regression model (lm) R2score: 0.48 (I'm not sharing the notebook, is too untidy)

After the first attempt the notebook was too untidy, so I decided to divide my work into 3 steps/notebooks:
- EDA & Statistics analysis.ipynb where I choose the independent variables based on the OLS Regression Results, I subset the dataset and export it as csv file. In this notebook are commented the decisions for all the other iterations;
- Features extraction.ipynb: is where some feature engineering is happening and where some discrete features are grouped by. 
- 4 notebooks with the iterations:
   - 2nd iteration: New categorical feature turned into dummies, improved linear model (lm) with KNN. Best R2 score = 0.59
   - 3rd iteration: This time the discrete variable are fed as such. lm+KNN Best R2 score=0.68
   - 4th iteration: Reduced number of independent variables, some of them turned into dummies. Logaritmic transformation on some numeric variables that have a skewed distribution. lm+KNN Best R2 score=0.55
   - 5th iteration: same features as the previous iteration, but fed as such. No correction for the skewed distribution. Best lm+KNN R2 score=0.62


## Results on the predictive model

In conclusion the best R2 scores obtained among my iterations are 0.67 and 0.62. 
In the first case the independent variables taken into consideration were: 'sqft_above', 'sqft_living15', 'bathrooms', 'view', 'sqft_basement','floors', 'grade', 'condition', 'yr_built'. 
In the second case the independent variables are 'sqft_living','sqft_above','bathrooms','view','grade'.
In both cases the categorical features where fed as discrete numeric variables. This probably means that my feature extraction and subsetting of the dataset was faulty. 
Additional variables or a more efficient subsetting of the initial dataset would have helped to better explain the variance in the housing price.

This conclusions are supported by the data analysis in Tableau. 

## Content of the repository
This repository contains the following folders:

- Dataset:
   - (Starting Dataset)
   - 1st Iteration
   - 2nd Iteration 
- Notebooks:
- SQL:
  - queries_linear_regression.sql 
- Tableau:
  - Business analysis.pdf
