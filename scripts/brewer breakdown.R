library(tidyverse)

# terrain_colors <- function (n, alpha, rev = FALSE) {
#   if ((n <- as.integer(n[1L])) > 0) {
#     k <- n%/%2
#     h <- c(4/12, 2/12, 0/12)
#     s <- c(1, 1, 0)
#     v <- c(0.65, 0.9, 0.95)
#     cols <- c(hsv(h = seq.int(h[1L], h[2L], length.out = k), 
#                   s = seq.int(s[1L], s[2L], length.out = k),
#                   v = seq.int(v[1L], v[2L],length.out = k), alpha = alpha),
#               hsv(h = seq.int(h[2L], h[3L], length.out = n - k + 1)[-1L],
#                   s = seq.int(s[2L], s[3L], length.out = n - k + 1)[-1L],
#                   v = seq.int(v[2L], v[3L], length.out = n - k + 1)[-1L],
#                   alpha = alpha))
#     if (rev) 
#       rev(cols)
#     else cols
#   }
#   else character()
# }
# 
# cm_colors <- function (n, alpha, rev = FALSE) {
#   if ((n <- as.integer(n[1L])) > 0L) {
#     even.n <- n%%2L == 0L
#     k <- n%/%2L
#     l1 <- k + 1L - even.n
#     l2 <- n - k + even.n
#     cols <- c(
#       if (l1 > 0L)
#         hsv(
#           h = 6 / 12,
#           s = seq.int(0.5, if (even.n) 0.5 / k else 0, length.out = l1),
#           v = 1, alpha = alpha),
#       if (l2 > 1)
#         hsv(h = 10 / 12, s = seq.int(0,0.5, length.out = l2)[-1L], v = 1, alpha = alpha))
#     if (rev) 
#       rev(cols)
#     else cols
#   }
#   else character()
# }
# 
# barplot(1:100, col = rainbow(100))
# barplot(1:100, col = heat.colors(100))
# barplot(1:100, col = terrain.colors(100))
# barplot(1:100, col = topo.colors(100))
# barplot(1:100, col = cm.colors(100))


# first try at creating function ------------------------------------------

heat_colors <- function (n, alpha, rev = FALSE, test_seq) {
  
  h <- test_seq
  s <- rep(0.69, length(h))
  v <- rep(1, length(h))
  
  hsv(h = h, s = s, v = v)
  
}

test_colors <- seq(0, 1, by = 0.1)
test_colors <- c(1, 0, 0.1, 0.2, 0.3)
test_colors <- c(1, seq(from = 0, to = 0.3, length.out = 100))

barplot(test_colors + 100,
        col = heat_colors(test_seq = test_colors))


# second try at creating function -----------------------------------------

heat_colors2 <- function (n, alpha, rev = FALSE, troubleshoot = FALSE) {
  
  ## Move from red to green
  pre_h <- seq(from = 0, to = 0.3, length.out = n - 1)
  h <- c(1, pre_h)
  
  ## Less bright
  s <- rep(0.69, length(h))
  
  ## Increasingly low value (darker)
  v <- seq(from = 1, to = 0.8, length.out = n)
  
  if(troubleshoot == FALSE){
    hsv(h = h, s = s, v = v)
  } else {
    data.frame(h = h, s = s, v = v)  
  }
}

barplot(rep(10, 50),
        col = heat_colors2(n = 50),
        border = NA)

heat_colors2(n = 50, troubleshoot = TRUE)
