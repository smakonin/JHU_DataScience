complete <- function(directory, id = 1:332) 
{
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        df <- data.frame(id = numeric(), nobs = numeric())
        for(i in seq_along(id))
        {
                filename <- paste0(directory, "/", formatC(id[i], width=3, flag="0"),".csv")
                l <- read.csv(filename)
                count <- sum(!is.na(l[,2] + l[,3]))
                df <- rbind(df, data.frame(id = id[i], nobs = count))
        }
        df
}
