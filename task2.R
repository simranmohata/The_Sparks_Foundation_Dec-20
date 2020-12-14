#Storing Iris data in variable "data"
data<- iris[,-5]
#Displaying the first 6 records
head(data)
# function to compute total within-cluster sum of square
f<- function(x)
{
  within<- kmeans(data,x)$tot.withinss
}
# Compute and plot wss for x = 1 to x = 15
x<- 1:15
plot(x,sapply(x,f),type="b",lwd="2")

#K means clustering with 3 clusters
model1<- kmeans(data,3)
model1


y<- iris$Species
table(y,model1$cluster)

#Visualizing the results
plot(data$Sepal.Length,data$Sepal.Width,col=model1$cluster,lwd=6,xlab="Sepal Length",
main="Kmeans Clustering
     Data-Iris",
     ylab="Sepal Width")

#Adding centroids to our graph
points(model1$centers[,1:2],col="blue",lwd=10)
legend("topright",c("Setosa","Versicolor","Virginica","Centroids"),
       fill=c(unique(model1$cluster),"blue"))
