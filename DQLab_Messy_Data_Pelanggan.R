library(openxlsx)
library(bpa)
library(RMySQL)

#Membaca dataset
data.pelanggan <- read.xlsx("E:/DQLab/Dataset/dqlab_messy_data_pelanggan.xlsx", sheet = "Pelanggan")
str(data.pelanggan)
summary(data.pelanggan)

#Merubah data.pelanggan$Aktif menjadi factor

#Merubah kolom data selain Nilai.Belanja.Setahun menjadi factor
data.pelanggan$Kode.Pelanggan <- as.factor(data.pelanggan$Kode.Pelanggan)
data.pelanggan$Nama.Lengkap <- as.factor(data.pelanggan$Nama.Lengkap)
data.pelanggan$Alamat <- as.factor(data.pelanggan$Alamat)
data.pelanggan$Tanggal.Lahir <- as.factor(data.pelanggan$Tanggal.Lahir)
data.pelanggan$Aktif <- as.character(data.pelanggan$Aktif)
data.pelanggan$Kode.Pos <- as.factor(data.pelanggan$Kode.Pos)
data.pelanggan$No.Telepon <- as.factor(data.pelanggan$No.Telepon)

#Menggunakan function basic_pattern_analysis
basic_pattern_analysis(x="DQLab")
basic_pattern_analysis(x="17 Agustus 1945")
basic_pattern_analysis(x="3.14")
basic_pattern_analysis(c("KD-008", "012345", "KD-010"), unique_only = TRUE)


#Menggunakan function basic_pattern_analysis pada kolom Kode.Pelanggan
basic_pattern_analysis(data.pelanggan$Kode.Pelanggan, unique_only = TRUE)

#Mengambil dataset yang memiliki pola teks "AA-9999" di kolom Kode.Pelanggan
basic_pattern_analysis(data.pelanggan$Kode.Pelanggan)=="AA-9999"

#Mengambil dataset yang memiliki pola teks "AA-9999" di kolom Kode.Pelanggan
data.pelanggan[basic_pattern_analysis(data.pelanggan$Kode.Pelanggan)=="AA-9999",]

#Menggunakan function basic_pattern_analysis pada kolom Nama
basic_pattern_analysis(data.pelanggan$Nama, unique_only = TRUE)

#Menggunakan function grepl untuk mengambil pola nama tidak lazim
data.pelanggan[grepl(pattern = "[^Aaw.,]", x = basic_pattern_analysis(data.pelanggan$Nama)),]
data.pelanggan[grepl(pattern = "ww", x = basic_pattern_analysis(data.pelanggan$Nama.Lengkap)),]

#Melakukan profiling terhadap seluruh kolom data.pelanggan 
pola.data.pelanggan <- basic_pattern_analysis(data.pelanggan)
names(pola.data.pelanggan) <- paste("Pola", names(pola.data.pelanggan), sep=".")
data.pelanggan <- cbind(data.pelanggan, pola.data.pelanggan)

str(data.pelanggan)
write.xlsx(data.pelanggan, file="data.pelanggan.xlsx")
