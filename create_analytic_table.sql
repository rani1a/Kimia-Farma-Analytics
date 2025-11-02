CREATE OR REPLACE TABLE `rakaminkfanalytics-476801.kimia_farma.kimia_farma_analytic` AS

SELECT
    -- KOLOM DARI TABEL TRANSACTION (kf_final_transaction)
    t.transaction_id,
    t.date,
    t.branch_id,
    t.customer_name,
    t.price AS actual_price,
    t.discount_percentage,
    t.rating AS rating_transaksi,

    -- KOLOM DARI TABEL KANTOR CABANG (kf_kantor_cabang)
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating AS rating_cabang, 

    -- KOLOM DARI TABEL PRODUCT (kf_product)
    t.product_id,
    p.product_name,
    
    -- 1. PERHITUNGAN PERSENTASE GROSS LABA
    (CASE
        WHEN t.price > 500000 THEN 0.30
        WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
        WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
        WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
        WHEN t.price <= 50000 THEN 0.10
        ELSE 0.0
    END) AS persentase_gross_laba,

    -- 2. PERHITUNGAN NET SALES
    (t.price - (t.price * t.discount_percentage)) AS nett_sales,

    -- 3. PERHITUNGAN NET PROFIT
    (t.price - (t.price * t.discount_percentage)) * (CASE
        WHEN t.price > 500000 THEN 0.30
        WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
        WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
        WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
        WHEN t.price <= 50000 THEN 0.10
        ELSE 0.0
    END) AS nett_profit

FROM
    `rakaminkfanalytics-476801.kimia_farma.kf_final_transaction` AS t
LEFT JOIN
    `rakaminkfanalytics-476801.kimia_farma.kf_kantor_cabang` AS kc
    ON t.branch_id = kc.branch_id
LEFT JOIN
    `rakaminkfanalytics-476801.kimia_farma.kf_product` AS p
    ON t.product_id = p.product_id
;