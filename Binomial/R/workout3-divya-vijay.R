
#' @title bin choose
#' @description calculates number of combinations in which k successes can occur in n trials
#' @param k number of successes
#' @param n number of trials
#' @return the number of combinations
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose <- function(n, k){
  if(any(k > n)){
    stop("k cannot be greater than n")
  }
  else {
    return(factorial(n) / (factorial(k) * factorial(n - k)))
  }
}

#' @title bin probability
#' @description calculates probability of getting a certain number of successes in a given number of trials
#' @param success number of successes
#' @param trials number of trials
#' @param prob probability of success
#' @return the probability of that number of successes
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)

  return(bin_choose(trials, success) * (prob ^ success) * ((1 - prob) ^ (trials - success)))
}

#' @title bin distribution
#' @description creates a dataframe of a probability distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return a dataframe of class binomial distribution
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob){
  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  dat <- as.data.frame(cbind(success, probability))
  class(dat) <- c('bindis', 'data.frame')
  return(dat)
}
dat = bin_distribution(trials = 5, prob = 0.5)


#'@export
plot.bindis <- function(x){
  return(barplot(x$probability,
                 names.arg = x$success,
                 xlab = "successes",
                 ylab = "probability"))
}

plot(dat)


#'@title bin cumulative
#'@description creates a dataframe of the probability distribution and cumulative probabilities
#'@param trials number of trials
#'@param prob value of probability
#'@return dataframe of primary class bincum
#'@export
#'@examples
#'bin_cumulative(trials = 5, prob = 0.5)
#'bin_cumulative(trials = 3, prob = 0.1)

bin_cumulative <- function(trials, prob){
  dat2 <- bin_distribution(trials, prob)
  a<-cumsum(dat2$probability)
  dat2$cumulative <- a
  class(dat2) <- c('bincum', 'data.frame')
  return(dat2)
}

dat2 = bin_cumulative(trials = 5, prob = 0.5)

#'@export
plot.bincum <- function(x) {
  plot(x$cumulative,
       type = 'o',
       xlab = 'successes',
       ylab = 'probability',
       xaxt = 'n')
  axis(1, at = 1:length(x$success), labels = x$success)
}

plot(dat2)

#1.7) Function bin_variable()

#'@title bin variable
#'@description returns a list of trials and probability
#'@param trials number of trials
#'@param prob value of probability
#'@return an list of class binvar
#'@export
#'@examples
#'bin_variable(trials = 10, p = 0.3)
#'bin_variable(trials = 5, p = 0.1)

bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  my_list <- list(trials = trials, prob = prob)
  class(my_list) <- c('binvar')
  return(my_list)
}


#'@export
print.binvar <- function(x) {
  cat('"Binomial variable"\n')
  cat('\n')
  cat('Parameters\n')
  cat(sprintf('- number of trials : %s', x$trials, '\n'))
  cat('\n')
  cat(sprintf('- prob of success : %s', x$prob,"\n"))
}
bin1 <- bin_variable(trials = 10, p = 0.3)
bin1

#'@export
summary.binvar <- function(x){
  mean <- aux_mean(x$trials, x$prob)
  variance <- aux_variance(x$trials, x$prob)
  mode <- aux_mode(x$trials, x$prob)
  skewness <- aux_skewness(x$trials, x$prob)
  kurtosis <- aux_kurtosis(x$trials, x$prob)
  obj <- list(trials = x$trials, prob = x$prob, mean = mean, variance = variance, mode = mode, skewness = skewness, kurtosis = kurtosis)
  class(obj) <- "summary.binvar"
  return(obj)
}

#'@export
print.summary.binvar <- function(x) {
  cat('"Summary Binomial"\n')
  cat('\n')
  cat('Parameters\n')
  cat(sprintf('- number of trials : %s', x$trials, '\n'))
  cat('\n')
  cat(sprintf('- prob of success : %s', x$prob,"\n"))
  cat('\n')
  cat('\n')
  cat('Measures\n')
  cat(sprintf('- mean : %s', x$mean, '\n'))
  cat('\n')
  cat(sprintf('- variance : %s', x$variance, '\n'))
  cat('\n')
  cat(sprintf('- mode : %s', x$mode, '\n'))
  cat('\n')
  cat(sprintf('- skewness : %s', x$skewness, '\n'))
  cat('\n')
  cat(sprintf('- kurtosis : %s', x$kurtosis, '\n'))

}

bin1 <- bin_variable(trials = 10, p = 0.3)
binsum1 <- summary(bin1)
binsum1


# 1.8) Functions of Measures

#'@title bin mean
#'@description calculates mean for binomial distribution
#'@param trials number of trials
#'@param prob value of probability
#'@return mean summary measure
#'@export
#'@examples
#'bin_mean(10, 0.3)
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#'@title bin variance
#'@description calculates variance for binomial distribution
#'@param trials number of trials
#'@param prob value of probability
#'@return variance summary measure
#'@export
#'@examples
#'bin_variance(10, 0.3)

bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#'@title bin mode
#'@description calculates mode for binomial distribution
#'@param trials number of trials
#'@param prob value of probability
#'@return mode summary measure
#'@export
#'@examples
#'bin_mode(10, 0.3)

bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#'@title bin skewness
#'@description calculates skewness for binomial distribution
#'@param trials number of trials
#'@param prob value of probability
#'@return skewness summary measure
#'@export
#'@examples
#'bin_skewness(10, 0.3)

bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#'@title bin kurtosis
#'@description calculates kurtosis for binomial distribution
#'@param trials number of trials
#'@param prob value of probability
#'@return kurtosis summary measure
#'@export
#'@examples
#'bin_kurtosis(10, 0.3)

bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}


