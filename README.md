<h1 align="center" style="color:MediumSeaGreen;"> <b> THE OLYMPICS (In Progress) </b></h1>


<img src="https://sunrisevt.com/wp-content/uploads/2018/01/OLYMPICS-BANNER.jpg" alt="Olympic Medals" width="1100" align="center">


<p align="center">
  <a href="#Introduction">Introduction</a> •
  <a href="#objective">Objective</a> •
  <a href="#problem-statement">Problem Statement</a> •
  <a href="#data">Data</a> •
  <a href="#use-case">Use Case</a> •
  <a href="#scope">Scope</a> •
  <a href="method">Progress</a> •
  <a href="#language-and-tools">Languages & Tools</a> •
  <a href="#license">License</a>
  
</p>

---

## :white_check_mark: **Introduction** 
<p>
The Olympic Games are the world's most prestigious sporting event, featuring the world's best athletes competing for gold, silver, and bronze medals. With over a century of Olympic data, it is possible to use machine learning algorithms to predict which participant is likely to win a medal in a particular event. In this project, we will use Olympics data from 1896 to 2016 to develop a predictive model that can identify athletes who are most likely to win medals in their respective events and will be tested on the Olympics data set of 2018 to 2022 as its unseen. Given that the games has occured in real life, we can determine how well the model can predict.</p>

<br>

## :white_check_mark: **Objective** 
<p >The project aims to leverage ETL pipelines and machine learning techniques to analyze Olympics data and develop a predictive model that can identify athletes most likely to win medals in their respective events. The model will use a range of features, such as an athlete's age, gender, height, weight and other relevant factors to predict their chances of winning a medal. </p>

<p>The objective of this project is to create a dashboard that when a new athlete details it plugged in, it can predict the likelihood of an athlete winning a medal in the Olympic Games. By analyzing past data, we can identify patterns and trends that can help us predict future outcomes. </p>

<br>

## :white_check_mark: **Problem Statement** 

The Olympic Games are highly competitive events, with thousands of athletes competing for medals. It is difficult to identify which athlete is most likely to win a medal in a particular event, as there are many factors that can influence an athlete's performance. This project aims to solve this problem by using machine learning algorithms to analyze past Olympics data and predict which athlete is most likely to win a medal in their respective event.

<br>

## :white_check_mark: **Data** 

 - [Olympics Athlete Data 1896 to 2016](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results?resource=download) 
 - [Olympics Website](https://olympics.com/en/olympic-games)
 - [Cost of Olympics Hosting](https://journals.sagepub.com/doi/full/10.1177/0308518X20958724)
 - [Medal Cost](https://en.wikipedia.org/wiki/Incentives_for_Olympic_medalists_by_country)

<br>

## :white_check_mark:  **Use Case**  

The predictive model developed in this project has several potential use cases: 
- Used by athletic scout for faster talent scout or filter.
- Used by sports analysts, coaches, and athletes to identify areas for improvement and optimize training programs. 
- Used by broadcasters and media companies to provide more accurate predictions and analysis of the Olympic Games.

<br>

##  :white_check_mark: **Scope** 

`'Technical'` <br>
From a technical perspective, the project involves data preprocessing and cleaning, feature engineering, model selection, and evaluation. The machine learning algorithms used will include classification techniques

`'Business'` <br>
From a business perspective, the predictive model can provide valuable insights for coaches, athletes, and sports analysts, helping them make more informed decisions and optimize performance.

<br>

## :white_check_mark: **Progress** 
1. Data Cleaning ✔️ - Click [Here](https://nbviewer.org./github/JZMNE/The-Olympics/blob/main/InitialDataCleaning.ipynb) to view
2. Model Building in SQL ✔️ - Click [Here](https://github.com/JZMNE/The-Olympics/blob/main/Schema%20Modelling.sql) to view
3. Data Visualization in python using Pandas and plotly ✔️ - Click [Here](https://nbviewer.org./github/JZMNE/The-Olympics/blob/main/Python%20Visualization.ipynb) to view
4. Predictive Model with Scikit Learn and Pycaret ✔️ - Click [Here](https://nbviewer.org./github/JZMNE/The-Olympics/blob/main/ML%20Pipeline%20Using%20Scikit%20Learn.ipynb.ipynb) to view
5. Build a Webpage using integrated with the model and PBI forecaster to create a predictive dashboard 

> Note: [The Sturgeon's law](https://en.wikipedia.org/wiki/Sturgeon%27s_law)

<br>

## :white_check_mark: **Language and Tools** 

<p align="left"> 
    <a href="https://www.microsoft.com/en-us/sql-server" target="_blank" rel="noreferrer"> <img src="https://www.svgrepo.com/show/303229/microsoft-sql-server-logo.svg" alt="mssql" width="60" height="60"/> </a> 
    <a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" alt="python" width="60" height="60"/> </a> 
    <a href="https://pandas.pydata.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/2ae2a900d2f041da66e950e4d48052658d850630/icons/pandas/pandas-original.svg" alt="pandas" width="60" height="60"/> </a>
    <a href="https://numpy.org/" target="_blank" rel="noreferrer"> <img src="https://numpy.org/images/logo.svg" alt="Numpy" width="60" height="60"/> </a> 
    <a href="https://plotly.com/" target="_blank" rel="noreferrer"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Plotly-logo.png/1200px-Plotly-logo.png" alt="Plotly"  height="60"/> </a>
    <a href="https://matplotlib.org/" target="_blank" rel="noreferrer">
  <img src="https://matplotlib.org/stable/_static/logo2_compressed.svg" alt="Matplotlib" width="60" height="60"/> </a>
    <a href="https://scikit-learn.org/" target="_blank" rel="noreferrer"> <img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Scikit_learn_logo_small.svg" alt="scikit_learn" width="60" height="60"/> </a> 
    <a href="https://pycaret.org/" target="_blank" rel="noreferrer"> <img src="https://www.gitbook.com/cdn-cgi/image/width=60,dpr=2,height=60,fit=contain,format=auto/https%3A%2F%2F1927305171-files.gitbook.io%2F~%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FjAq5m5T7Qtz03TnB0Wve%252Ficon%252FKaPEfJEWupL6s9rsdFyF%252FGit%2520500-500_v5WhiteBG.png%3Falt%3Dmedia%26token%3D83cdee15-29e2-4fd3-8392-d1688963a063" alt="Pycaret" width="60" height="60"/> </a> 
    <a href="https://powerbi.microsoft.com/" target="_blank" rel="noreferrer"> <img src="https://powerbi.microsoft.com/pictures/shared/social/social-default-image.png" alt="PowerBI" width="90" height="60"/> </a> 
 </p>

<br>


## :white_check_mark: **License**  

Scouty is license under the [MIT](https://github.com/JZMNE/The-Olympics/blob/main/LICENSE) license.

© <i>2023 Jazmine N </i>

[![](https://visitcount.itsvg.in/api?id=JZMN&label=Project%20Views&color=3&icon=3&pretty=true)](https://visitcount.itsvg.in)
