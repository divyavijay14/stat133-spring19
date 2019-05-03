#1.2) Private Auxiliary Functions

#Private function to calculate mean of distribution
aux_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(prob * trials)
}

#Private function to calculate variance of distribution
aux_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return((trials * prob) * (1 - prob))
}

#Private function to calculate mode of distribution
aux_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  floor((trials * prob) + prob)
}

#Private function to calculate skewness of distribution
aux_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return((1 - (2 * prob)) / sqrt((trials * prob) * (1 - prob)))
}

#Private function to calculate kurtosis of distribution
aux_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  top = 1 - ((6 * prob) * (1 - prob))
  bottom = ((trials * prob) * (1 - prob))
  return(top / bottom)
}

# aux_mean(10, 0.3)
# aux_variance(10, 0.3)
# aux_mode(10, 0.3)
# aux_skewness(10, 0.3)
# aux_kurtosis(10, 0.3)
