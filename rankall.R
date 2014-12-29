# Copyright (C) 2014 by Stephen Makonin.

source("./rankhospital.R")

rankall <- function(outcome, num = "best") 
{
        ## Read outcome data
        d <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        states <- sort(as.vector(unique(d$State)))
        
        ## Check that outcome is valid
        #if(!is.element(outcome, names(d[3:5])))
        #        stop("invalid outcome")
        
        ## For each state, find the hospital of the given rank
        hospitals <- vector(mode = "character")
        for(state in states)
        {
                hospitals <- c(hospitals, rankhospital(state, outcome, num, d))                
        }
        d <- data.frame(hospitals, states, row.names = states)
        names(d) <- c("hospital", "state")
        
        ## Return a data frame with the hospital names and the (abbreviated) state name
        d
}
