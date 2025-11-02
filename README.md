# Proyek Analisis Kinerja Bisnis Kimia Farma (2020-2023)
# Author: Rania
Ini adalah *submission* untuk *Final Task* Project-Based Internship: Big Data Analytics di Kimia Farma, oleh Rakamin Academy.

## Deskripsi Proyek
Proyek ini mencakup proses ETL (Extract, Transform, Load) data mentah Kimia Farma dari empat sumber berbeda, dilanjutkan dengan analisis dan visualisasi kinerja bisnis dari tahun 2020-2023.

## Tools yang Digunakan
* Google BigQuery (Untuk ETL dan Query SQL)
* Google Looker Studio (Untuk Visualisasi Dashboard)
* SQL

## Isi Repository
* **create_analytic_table.sql**: Ini adalah *syntax* SQL lengkap yang digunakan di Google BigQuery untuk:
    1.  Menggabungkan (JOIN) empat tabel mentah: `kf_final_transaction`, `kf_kantor_cabang`, `kf_product`, dan `kf_inventory`.
    2.  Menghitung metrik bisnis wajib (seperti `nett_sales`, `persentase_gross_laba`, dan `nett_profit`) menggunakan logika `CASE WHEN`.
    3.  Membuat satu tabel analisis akhir bernama `kimia_farma_analytic` yang menjadi sumber data untuk Looker Studio.

* **README.md**: Penjelasan singkat proyek ini.
