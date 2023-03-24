<h1 align="center" style="color:MediumSeaGreen;"> <b> PROJECT SCOUTY  </b></h1>


<img src="https://media3.giphy.com/media/68QRW1GqBH5tFNGXPZ/giphy.gif?cid=ecf05e47z1isu886ykeb9dzundi12x98pbiekixmsjy715ez&rid=giphy.gif&ct=g" alt="Olympic Medals" width="800" align="center">


<p align="center">
  <a href="#Introduction">Introduction</a> •
  <a href="#objective">Objective</a> •
  <a href="#problem-statement">Problem Statement</a> •
  <a href="#data">Data</a> •
  <a href="#use-case">Use Case</a> •
  <a href="#scope">Scope</a> •
  <a href="method">Method</a> •
  <a href="#language-and-tools">Languages & Tools</a> •
  <a href="#license">License</a>
  
</p>

---

## :round_pushpin: **Introduction** 
<p>
The Olympic Games are the world's most prestigious sporting event, featuring the world's best athletes competing for gold, silver, and bronze medals. With over a century of Olympic data, it is possible to use machine learning algorithms to predict which participant is likely to win a medal in a particular event. In this project, we will use Olympics data from 1896 to 2016 to develop a predictive model that can identify athletes who are most likely to win medals in their respective events. </p>

<br>

## 🎯 **Objective** 
<p >The project aims to leverage ETL pipelines and machine learning techniques to analyze Olympics data and develop a predictive model that can identify athletes most likely to win medals in their respective events. The model will use a range of features, such as an athlete's age, gender, height, weight and other relevant factors to predict their chances of winning a medal. </p>

<p>The objective of this project is to create a dashboard that when a new athlete details it plugged in, it can predict the likelihood of an athlete winning a medal in the Olympic Games. By analyzing past data, we can identify patterns and trends that can help us predict future outcomes. </p>

<p>I aim to utilize this project as a means to review and reinforce all the knowledge I have acquired thus far, while also creating a portfolio that I can submit to Maven Analytics for a chance to be featured on their website.</p>
<br>

## :clipboard: **Problem Statement** 

The Olympic Games are highly competitive events, with thousands of athletes competing for medals. It is difficult to identify which athlete is most likely to win a medal in a particular event, as there are many factors that can influence an athlete's performance. This project aims to solve this problem by using machine learning algorithms to analyze past Olympics data and predict which athlete is most likely to win a medal in their respective event.

<br>

## :bar_chart:  **Data** 

The project will use [Olympics](https://www.mavenanalytics.io/data-playground?page=3&pageSize=5) data from 1896 to 2016, which includes information on athletes, events, and medal winners. The dataset includes a range of features such as age, gender, sport, and country. The data will be preprocessed and cleaned to ensure that it is suitable for machine learning analysis.

<br>
<br>


## :white_check_mark:  **Use Case**  

The predictive model developed in this project has several potential use cases: 
- Used by athletic scout for faster talent scout or filter.
- Used by sports analysts, coaches, and athletes to identify areas for improvement and optimize training programs. 
- Used by broadcasters and media companies to provide more accurate predictions and analysis of the Olympic Games.

<br>

##  :wrench: **Scope** 

`'Technical'` <br>
From a technical perspective, the project involves data preprocessing and cleaning, feature engineering, model selection, and evaluation. The machine learning algorithms used will include regression, classification, and clustering techniques. 

`'Business'` <br>
From a business perspective, the predictive model can provide valuable insights for coaches, athletes, and sports analysts, helping them make more informed decisions and optimize performance.

<br>


## :paperclip: **Method** 
1. Import Data as a CSV
2. Separated Data with Nulls and determine its usefulness in Python EDA (Two Dataset - )
3. Create an ETL solution to clean data
4. Using SQL to build a Star schema model in SSMS for easy OLAP purposes.
    - Building a dimensions.
    - Building an all numeric fact Table
    - Creating Buckets and Flags
    - Creating a flat table of clean data for easy importation to Power BI for analysis.
5. Step 2 will continue in python using numpy, pandas and seaborn library
    - Records having more than 3 features missing will be eliminated
    - Records having less than 1 featues missing will replaced using a suitable process (ffill, bfill, Average)
    - Visualiztion of data - might use ydataprofiling to get a focus for the data.
    - Create a Data Viz module to easy visualization across my data
6. Using Pycaret to build a predictive model (might integrate explicit scikit learning fucntions)
7. Build a Power BI dashboard using integrated with the model and PBI forecaster to create a predictive dashboard 

<br>


## :warning: **Something Unique** 
> Still figuring it out the 10% that is not [crap](https://en.wikipedia.org/wiki/Sturgeon%27s_law)

> __This ReadMe is subject to changes as ideas comes and goes.__
<h6><b> Rubber Duck Ideas </b></h6>

- Perform identical operations for data preparation and manipulation in SQL and Python.
- Build an ETL process that transforms and loads the data into a suitable format for forecasting the performance of new athletes based on a spreadsheet file provided by an athletics scout.
- Use Py caret integrate with Power BI forecaster to create a predictive model and dashboard respectively that can forecast outcomes on newly gotten data that has undergone the ETL process.

<br>

## :speech_balloon: **Language and Tools** 

<p align="left"> 
    <a href="https://www.microsoft.com/en-us/sql-server" target="_blank" rel="noreferrer"> <img src="https://www.svgrepo.com/show/303229/microsoft-sql-server-logo.svg" alt="mssql" width="60" height="60"/> </a> 
    <a href="https://learn.microsoft.com/en-us/sql/integration-services/ssis-how-to-create-an-etl-package?view=sql-server-ver16" target="_blank" rel="noreferrer"> <img src="https://visualstudio.microsoft.com/wp-content/uploads/2022/11/vs-icon.svg" alt="VisualStudio SSIS" width="60" height="60"/> </a> 
    <a href="https://pandas.pydata.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/2ae2a900d2f041da66e950e4d48052658d850630/icons/pandas/pandas-original.svg" alt="pandas" width="60" height="60"/> </a>
    <a href="https://numpy.org/" target="_blank" rel="noreferrer"> <img src="https://numpy.org/images/logo.svg" alt="Numpy" width="60" height="60"/> </a> 
    <a href="https://seaborn.pydata.org/" target="_blank" rel="noreferrer"> <img src="https://seaborn.pydata.org/_static/logo-wide-lightbg.svg" alt="Seaborn" width="80" height="80"/> </a> 
    <a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" alt="python" width="60" height="60"/> </a> 
    <a href="https://scikit-learn.org/" target="_blank" rel="noreferrer"> <img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Scikit_learn_logo_small.svg" alt="scikit_learn" width="60" height="60"/> </a> 
    <a href="https://pycaret.org/" target="_blank" rel="noreferrer"> <img src="https://www.gitbook.com/cdn-cgi/image/width=60,dpr=2,height=60,fit=contain,format=auto/https%3A%2F%2F1927305171-files.gitbook.io%2F~%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FjAq5m5T7Qtz03TnB0Wve%252Ficon%252FKaPEfJEWupL6s9rsdFyF%252FGit%2520500-500_v5WhiteBG.png%3Falt%3Dmedia%26token%3D83cdee15-29e2-4fd3-8392-d1688963a063" alt="Pycaret" width="60" height="60"/> </a> 
    <a href="https://powerbi.microsoft.com/" target="_blank" rel="noreferrer"> <img src="https://powerbi.microsoft.com/pictures/shared/social/social-default-image.png" alt="PowerBI" width="90" height="60"/> </a> 
 </p>

<br>


## :exclamation: **License**  

<p>Scouty is license under the MIT license. </p>

© <i>2023 Jazmine N </i>

<p>
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
</p>
