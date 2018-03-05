# Meetup #1! 

## What we will do ?

We will do a small project that imports Amazon S3 public data and runs a machine learning algorithm called random forest to classify whether a high school is public or private based on multiple variables. The set is then encapsulated in a wrapper to transform any script and thus idea into a microservice that can be dockerizer and put into production on any existing cloud. 

<p align="center">
<b> <i> The aims of this meetup is to turn your R script as an experimental microservice. </i> </b>
</p>

## Things to remember after the meetup <i> #doublequote </i>

> Thanks to space-time of Poincaré-Minkowski it exist people that can do fast prototyping.  
> Each click on the keyboard must have an immediate impact in reality.

## Install R-cran and RStudio

R-Cran : https://cran.r-project.org/  
RStudio : https://www.rstudio.com/products/rstudio/download/  

## Packages to install

```R
install.packages("randomForest", dependencies = TRUE)
install.packages("plumber", dependencies = TRUE)
install.packages("dplyr", dependencies = TRUE)
```

## This meetup is made for :

- [x] Farmer.
- [x] Programmer.
- [x] Student.
- [x] Baker, mostly baker.

## Understand pdg_structure variables ?

```R
A- High school with only L, ES and S;
B- High school with only L, ES, S and STMG;
C- High school with L, ES, S, STMG and other series;
D- High school with L, ES, S and other non-STMG series;
E- Hotel school;
F- Other high school with no more than three series;
G- Other high school with at least four sets.
```

## You will certainly put that on your terminal at the end of the meetup

```R
curl --data '{"ntree":500, "na_wtf":"na.roughfix"}' "http://localhost/meetup"
curl --data '{"ntree":500, "na_wtf":"na.omit"}' "http://localhost/meetup"
```

## Docker, only for motivated people 

You have to run this commands inside the working repository

```R
docker build -t microservice . 
docker run --rm -p 80:8000 microservice
```

Now you just have to push your images on your desired cloud inside a docker containers.