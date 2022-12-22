complete <- function(directory, id = 1:332) {
  directory <- paste(getwd(),"/","specdata","/",sep="")
  file_list <- list.files(directory)
  ids <- vector()
  nobs <- vector()
  for (i in id) {
    file_dir <- paste(directory,file_list[i],sep="")
    file_data <- read.csv(file_dir)
    ids = c(ids,i)
    nobs = c(nobs,sum(complete.cases(file_data)))        
  }
  data.frame(id = ids, nobs = nobs)
}