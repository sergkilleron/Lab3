source("complete.R")

corr <- function(directory, threshold = 0) {
  directory <- paste(getwd(),"/",directory,"/",sep="")    
  observations <- complete(directory)
  filtered_observations = subset(observations,observations$nobs > threshold)
  file_list <- list.files(directory)
  correlation <- vector()
  for (i in filtered_observations$id) {
    file_dir <- paste(directory,file_list[i],sep="")
    file_data <- read.csv(file_dir)
    file_data <- subset(file_data,complete.cases(file_data))        
    correlation <- c(correlation,cor(file_data$nitrate,file_data$sulfate))    
  }
  correlation
}