#' Create named character vector from individual vectors
create_named_chr <-
  function (x, y){
    quostr <- function(list) {
      options(useFancyQuotes = FALSE)
      list2 <- lapply(list, function(x) toString(dQuote(x)))
      list2
    }
    weave <- function(list1, list2, num) {
      paste0(list1[num], "=", list2[num])
    }
    len <- length(x)
    temp <- sapply(1:len, weave, list1 = quostr(x), list2 = quostr(y))
    temp <- paste(temp, collapse = ", ")
    temp <- paste0("c(", temp, ")")
    return(eval(parse(text = temp)))
  }

