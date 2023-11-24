library(testthat)
library(httr)
library(testthat)
rm(list = ls())
source("Vize_Q1_210401069_mervenur_celik.R")

#--------------------------------Test 1.1--------------------------------#
test_that("Global Workspace’de spotifdy_token adlı bir değişken olmalı.",{
  testthat::expect_true(exists("spotify_token"))
})
#--------------------------------Test 1.1--------------------------------#
  test_that("Global Workspace’de spotify_token adlı bir değişken olmalı.",{
    testthat::expect_true(exists("spotify_token"))
  })

#--------------------------------Test 1.2--------------------------------#
test_that("spotify_token adlı değişkenin tipi “function” olmalı.", {
  testthat::expect_true(is.function(spotify_token))
})

#--------------------------------Test 1.3--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü çıktı bir liste olmalı", {
  output <- spotify_token()
  testthat::expect_true(is.list(output))
})

#--------------------------------Test 1.4--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü listenin iki elementi olmalı", {
  output <- spotify_token() 
  expect_length(output, 2)
})

#--------------------------------Test 1.5--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü listenin ilk elementinin ismi status_code olmalı", {
  output <- spotify_token()
  expect_identical(names(output)[1], "status_code")
})

#--------------------------------Test 1.6--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü listenin ilk elementinin class’ı numeric olmalı", {
  output <- spotify_token() 
  expect_true(is.numeric(output[[1]]))
})

#--------------------------------Test 1.7--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü listenin status_code adlı elementinin değeri 200’e eşit olmalı", {
  output <- spotify_token()
  expect_true(output$status_code == 200)
})

#--------------------------------Test 1.8--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü listenin ikinci elementinin ismi token olmalı", {
  output <- spotify_token()
  expect_identical(names(output)[2], "token")
})

#--------------------------------Test 1.9--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü listenin ikinci elementinin class’ı character olmalı", {
  output <- spotify_token()
  expect_true(is.character(output[[2]]))
})

#--------------------------------Test 1.10--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü listenin ikinci elementi ’Bearer ’ ile başlamalı", {
  output <- spotify_token()
  expect_true(startsWith(output[[2]], "Bearer"))
})

#--------------------------------Test 1.11--------------------------------#
test_that("spotify_token() çağrıldığında döndürdüğü listenin ikinci elementi character değişkeninin içinde 122 adet harf bulunmalı", {
  output <- spotify_token()
  expect_true(nchar(output[[2]]) == 122)
})




