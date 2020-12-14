#importing data
data <- read.csv("C:\\Users\\user\\Desktop\\Sparks\\student_score.csv")
#Displaying the first 6 values of the data
head(data)
View(data)
#For obtaining summary statistics
summary(data)
#Plotting the given data
plot(data$Hours,data$Scores,xlab="Number of Study Hours",ylab="Percentage Score",
     main="Score v/s Study Hours",col="blue",lwd="3")

#Observation : From the graph we can clearly see a positive linear relation between 
#the number of study hours and percentage of score

#A linera regression model using "lm" function
linear_relation<- lm(Scores~Hours,data=data)
linear_relation
abline(linear_relation$coefficients,col="red",lwd="2")


p<-predict(linear_relation)
data.frame(data$Scores,p)

#Predicted score when the student studies for 9.25 hours
predict(linear_relation,data.frame(Hours=9.25))

#installing package MLmetrics
install.packages("MLmetrics")
library("MLmetrics")

#computes the average absolute difference between two numeric vectors
MAE(data$Scores,p)

