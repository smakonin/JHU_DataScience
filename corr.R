corr <- function(directory, threshold = 0) 
{
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        correl <- numeric(0)
        df <- complete(directory)
        for(i in 1:nrow(df))
        {
                row <- df[i,]
                if(row$nobs >= threshold)
                {
                        filename <- paste0(directory, "/", formatC(row$id, width=3, flag="0"),".csv")
                        l <- read.csv(filename)
                        c <- cor(l$sulfate, l$nitrate, use = "na.or.complete")
                        correl = c(correl, c)
                }
        }
        correl
}
