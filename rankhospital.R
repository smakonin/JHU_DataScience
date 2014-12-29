rankhospital <- function(state, outcome, num = "best", d = NA) 
{
        ## Read outcome data
        if(is.na(d[1, 1]))
                d <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        
        d <- data.frame(d$State, d$Hospital.Name,
                        d$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,
                        d$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,
                        d$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
        names(d) <- c("State", "Hospital", "heart attack", "heart failure", "pneumonia")
        suppressWarnings(d[, "heart attack"] <- as.numeric(as.character(d[, "heart attack"])))
        suppressWarnings(d[, "heart failure"] <- as.numeric(as.character(d[, "heart failure"])))
        suppressWarnings(d[, "pneumonia"] <- as.numeric(as.character(d[, "pneumonia"])))
        
        ## Check that state and outcome are valid
        d <- subset(d, State == state)
        if(nrow(d) == 0)
                stop("invalid state")
        
        if(!is.element(outcome, names(d[3:5])))
                stop("invalid outcome")
        
        ## Return hospital name in that state with the given rank 30-day death rate
        decreasing = FALSE
        if(num == "worst")
                decreasing = TRUE

        if(num == "best" | num == "worst")
                num = 1
        
        idx <- order(d[, outcome], d[, "Hospital"], na.last = NA, decreasing = decreasing)[num]
        if(is.na(idx))
                return(NA)
        
        name <- as.character(d[idx, "Hospital"])
        name        
}
