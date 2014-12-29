pollutantmean <- function(directory, pollutant, id = 1:332) 
{
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        data <- numeric(0)
        for(i in seq_along(id))
        {
                filename <- paste0(directory, "/", formatC(id[i], width=3, flag="0"),".csv")
                l <- lapply(read.csv(filename)[pollutant], as.numeric)[[1]]
                data <- c(data, l)
        }
        mean(data, na.rm = TRUE)
}
