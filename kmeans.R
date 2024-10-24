rm(list=ls(all=TRUE))

x<-sample(0:200,100)  # 100 random numbers from 0 to 200
y<-sample(0:200,100)
data<-array(c(x,y), dim = c(100,2)) 
# The data is a 2-D array. The first column consists of the X coordinates, 
# and the second column consists of the Y-coordinates.

k_means <- function(data,k,max.iter=100){
  rows <- nrow(data)                 
  cols <- ncol(data)
  iter = 0
  
  nameMatrix <- matrix(0,rows,2)
  centers <- matrix(0,k,cols)
  randomNum <- as.matrix(sample(1:rows,k))
  
  for(i in 1:k){
    nameMatrix[randomNum[i],1] <- i
    centers[i,] <- as.matrix(data[randomNum[i],])
    centers <- matrix(centers,k,cols)
  }
  
  changed <- TRUE
  while(changed){ 
    
    if(iter >= max.iter)
      break
    
    changed <- FALSE
    
    for(i in 1:rows){ 
      initialDistance <- 10000 
      formerCluster <- nameMatrix[i,1]
      for(j in 1:k){ 
        currentDistance <- (sum((data[i,]-centers[j,])^2))^0.5
        if(currentDistance < initialDistance){
          initialDistance <- currentDistance 
          nameMatrix[i,1] <- j 
          nameMatrix[i,2] <- currentDistance 
        } 
      }
      if(formerCluster!=nameMatrix[i,1]) 
        changed <- TRUE
    }
    
    for(i in 1:k){
      clusterMatrix <- as.matrix(data[nameMatrix[,1]==i,])
      if(nrow(clusterMatrix)>0){ 
        centers[i,] <- colMeans(clusterMatrix) 
      } 
      else{
        centers[i,] <- centers[i,] 
      }    
    }
    iter = (iter+1)
  }
  colnames(centers) <- colnames(data)
  
  totss <- sum((t(data[,])-colMeans(data))^2)
  
  withinss <- numeric()
  for(i in 1:k){
    withinss[i] <- sum((t(data[nameMatrix[,1]==i,])-(centers[i,]))^2)
  }
  tot.withinss <- sum(withinss)
  
  betweenss <- 0
  for(i in 1:k){
    betweenss <- betweenss + sum(nrow(data[nameMatrix[,1]==i,])*(rowMeans(t(data[nameMatrix[,1]==i,]))-colMeans(data))^2)
  }
  
  size <- aggregate(nameMatrix[,1], by=list(nameMatrix[,1]),length)[,2]
  
  result <- list(cluster = nameMatrix[,1],centers = centers,totss = totss,withinss = withinss,tot.withinss = tot.withinss
                 ,betweenss = betweenss,size = size,iter = iter)
  return(result)
  
}

k_means(data,3)
kmeans.out <- kmeans(data,3)

plot(x,y,col=nameMatrix[,1])
