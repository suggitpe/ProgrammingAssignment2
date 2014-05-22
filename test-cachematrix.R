library('testthat')

source('cachematrix.R')

test_that("cachematrix inverses the matrix", {
    matrix <- makeCacheMatrix(matrix(1:25, 5))
    expect_that(cacheSolve(matrix)[1], equals(30))
    # second one will use the cached data
    expect_that(cacheSolve(matrix)[1], equals(30))
})
