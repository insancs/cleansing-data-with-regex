library(openxlsx)
library(bpa)
library(RMySQL)

#Membaca dataset
data.pelanggan <- read.xlsx("E:/DQLab/Dataset/dqlab_messy_data_pelanggan.xlsx", sheet = "Pelanggan")
str(data.pelanggan)
data.pelanggan$Nama.Lengkap

#Menghilangkan spasi ganda menggunakan REGEXP
data.pelanggan$Nama.Lengkap <- gsub(" {2,}", " ", data.pelanggan$Nama.Lengkap)
data.pelanggan$Nama.Lengkap <- trimws(data.pelanggan$Nama.Lengkap, which = "both")
data.pelanggan$Nama.Lengkap

data.pelanggan$Nama.Lengkap <- gsub("\\bbapak\\b", "", data.pelanggan$Nama.Lengkap, ignore.case = TRUE)
data.pelanggan$Nama.Lengkap <- gsub("\\bibu\\b", "", data.pelanggan$Nama.Lengkap, ignore.case = TRUE)
data.pelanggan$Nama.Lengkap <- gsub("\\bir\\b", "Ir", data.pelanggan$Nama, ignore.case = TRUE)
data.pelanggan$Nama.Lengkap

#Menghilangkan angka dan simbol menggunakan REGEXP
data.pelanggan$Nama.Lengkap <- gsub("[^A-Za-z .,]", "", data.pelanggan$Nama.Lengkap)
data.pelanggan$Nama.Lengkap <- trimws(data.pelanggan$Nama.Lengkap, which = "both")
data.pelanggan$Nama.Lengkap
