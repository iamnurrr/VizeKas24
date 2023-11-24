library(testthat)
library(httr)

rm(list = ls())
source("Vize_Q1_210401069_mervenur_celik.R")

#--------------------------------Test 2.1--------------------------------#
test_that("Global Workspace’de spotify_search_artist adlı bir değişken olmalı.",{
  expect_true(exists("spotify_search_artist"))
})

#--------------------------------Test 2.2--------------------------------#
test_that("spotify_search_artist adlı değişkenin tipi “function” olmalı.",{
  expect_is(spotify_search_artist, "function")
})

#--------------------------------Test 2.3--------------------------------#
test_that("spotify_search_artist() herhangi bir artist ismi ile çağrıldığında döndürdüğü çıktı bir liste olmalı.",{
  result <- spotify_search_artist("The Doors")
  expect_is(result, "list")
})

#--------------------------------Test 2.4--------------------------------#
test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin iki elementi olmalı",{
  result <- spotify_search_artist("The Doors")
  expect_length(result, 2)
})

#--------------------------------Test 2.5--------------------------------#
test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ilk elementinin ismi status_code olmalı",{
  result <- spotify_search_artist("The Doors")
  expect_identical(names(result)[1], "status_code")
})

#--------------------------------Test 2.6--------------------------------#
test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ilk elementinin class’ı numeric olmalı",{
  result <- spotify_search_artist("The Doors")
  expect_true(is.numeric(result$status_code))
})

#--------------------------------Test 2.7--------------------------------#
test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin status_code adlı elementinin değeri 200’e eşit olmalı",{
  result <- spotify_search_artist("The Doors")
  expect_equal(result$status_code, 200)
})

#--------------------------------Test 2.8--------------------------------#
test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin ismi search_results olmalı",{
  result <- spotify_search_artist("The Doors")
  expect_identical(names(result)[2], "search_results")
})

#--------------------------------Test 2.9--------------------------------#
test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin class’ı data.frame olmalı",{
  result <- spotify_search_artist("The Doors")
  expect_is(result$search_results, "data.frame")
})

#--------------------------------Test 2.10--------------------------------#
test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin iki sütun barındırmalı",{
  result <- spotify_search_artist("The Doors")
  expect_equal(ncol(result$search_results), 2)
})

#--------------------------------Test 2.11--------------------------------#
test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin sütun isimleri c(“artist”, “id”) olmalı",{
  result <- spotify_search_artist("The Doors")
  expect_equal(colnames(result$search_results), c("artist", "id"))
})

#--------------------------------Test 2.12--------------------------------#
test_that("spotify_search_artist('The Doors') çağrıldığında döndürdüğü listenin ikinci elementinin birinci satırının “id” adlı sütunu “22WZ7M8sxp5THdruNY3gXt” olmalı",{
  result <- spotify_search_artist("The Doors")
  expect_equal(result$search_results$id[1], "22WZ7M8sxp5THdruNY3gXt")
})