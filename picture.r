
library(jpeg)
library(png)
#a="/home/xiaoyh/inmic/inmic/static/image/phylo_tree.jpg"
#a="/home/xiaoyh/source/graphlan.png"
a="1.jpg"
    x <- readJPEG(a)
    dimx <- dim(x)
    n <- dimx[1]*dimx[2]
    r <- x[1:n]
    g <- x[(n+1):(2*n)]
    b <- x[(2*n+1):(3*n)]
    ps <- 10; ps <- dimx[1]*(ps-1) + ps  # 背景取值，ps为左上到右下角的像素，5。按情况修改 
    tv <-  0.1                      # tv为容差范围，0-1取值，越小越精确 
    sel <- abs(r-r[ps])<tv & abs(g-g[ps])<tv & abs(b-b[ps])<tv
    alpha <- rep(1, n)
    alpha[sel] <- 0
    x <- array(c(x, alpha), dim=c(dimx[1:2], 4))
    writePNG(x, "2.png")
