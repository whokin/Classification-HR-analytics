################################
# File name:        helper_functions.R
# Created on:       2020-12-20
# Last modified:    2020-12-20
# Description:      Set of useful functions I regularly use
################################

# Prints a modified summary of a dataframe giving a list of dimentions with
# - Data type
# - % of missing values
# - Factor levels if any
# - Number of cases for the smallest level of a factor
# - Mean for numeric values
# - Standard deviation of numeric variables

# BCA::variable.summary() modified ----
variable.summary <- function (dframe) 
{
  dframe <- as.data.frame(dframe)  # modification here: make sure dframe is type data frame, not tibble for example
  if (!is.data.frame(dframe)) 
    stop("The object is not a data frame.")
  Class <- unlist(lapply(1:ncol(dframe), function(i) class(dframe[, 
                                                                  i])))
  NAs <- 100 * (apply(dframe, 2, function(x) sum(as.numeric(is.na(x))))/nrow(dframe))
  varNum <- 1:length(names(dframe))
  Levels <- rep(NA, length(varNum))
  Min.Level <- rep(NA, length(varNum))
  Mean <- rep(NA, length(varNum))
  SD <- rep(NA, length(varNum))
  if (any(Class == "factor")) {
    varNumFac <- varNum[Class == "factor"]
    totLevel <- unlist(lapply(varNumFac, function(i) length(summary(dframe[, 
                                                                           i], maxsum = nrow(dframe)))))
    minLevel <- unlist(lapply(varNumFac, function(i) min(summary(dframe[, 
                                                                        i], maxsum = nrow(dframe)))))
    Levels <- rep(NA, length(varNum))
    Levels[varNumFac] <- totLevel
    Min.Level[varNumFac] <- minLevel
  }
  if (any(Class == "numeric") | any(Class == "integer")) {
    varNumNum <- varNum[Class == "numeric" | Class == "integer"]
    Means <- unlist(lapply(varNumNum, function(i) mean(dframe[, 
                                                              i], na.rm = TRUE)))
    Mean <- rep(NA, length(varNum))
    Mean[varNumNum] <- Means
    SDs <- unlist(lapply(varNumNum, function(i) sd(dframe[, 
                                                          i], na.rm = TRUE)))
    SD[varNumNum] <- SDs
  }
  outInfo <- data.frame(Class = Class, NAs = NAs, Levels = Levels, 
                        Min.Level = Min.Level, Mean = Mean, SD = SD)
  outInfo <- outInfo[order(outInfo$NAs), ]
  names(outInfo) <- c("Class", "%.NA", "Levels", "Min.Level.Size", 
                      "Mean", "SD")
  return(outInfo)
}