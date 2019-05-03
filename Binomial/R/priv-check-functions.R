#1.1) Private Checker Functions

#Private function to check whether input probability is valid
check_prob <- function(prob){
  if (prob > 1 | prob < 0) {
    stop("invalid prob value")
  }
  else{
    return(TRUE)
  }
}

#Private function to check whether input trials is valid
check_trials <- function(trials){
  if(trials <= 0){
    stop("invalid trials value")
  }
  else{
    return(TRUE)
  }
}

#Private function to check whether input success is valid

check_success <- function(success, trials) {
  if(any(success < 0)){
    stop('invalid success value')
  }
  if(any(success > trials)){
    stop('success cannot be greater than trials')
  }
  else{
    return(TRUE)
  }
}
