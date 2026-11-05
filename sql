-- Model ve sınıflara göre tespit sayıları ile ortalama güven skorunu hesaplar.
SELECT model_name, class, 
       COUNT(*) AS tespit_sayisi,
       ROUND(AVG(confidence), 2) AS ortalama_guven
FROM detections
GROUP BY model_name, class;
-- Işık bilgisi eksik olan görüntülerin oranını bulur.
SELECT 
    COUNT(*) AS toplam_goruntu,
    SUM(CASE WHEN lighting IS NULL THEN 1 ELSE 0 END) AS isik_bilgisi_bos_sayisi,
    ROUND(SUM(CASE WHEN lighting IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS bos_oran_yuzde
FROM images;
-- Yeterli veri içeren popüler sınıfları filtreler.
SELECT model_name, class, COUNT(*) AS tespit_sayisi
FROM detections
GROUP BY model_name, class
HAVING COUNT(*) >= 30;
-- Güven skorlarını low, medium, high şeklinde kategorize eder.
SELECT 
    CASE 
        WHEN confidence < 0.5 THEN 'low'
        WHEN confidence BETWEEN 0.5 AND 0.8 THEN 'medium'
        ELSE 'high'
    END AS guven_kategorisi,
    model_name,
    COUNT(*) AS sayi
FROM detections
GROUP BY guven_kategorisi, model_name;
-- Görüntülerin ışık koşullarına göre modellerin ortalama güven başarımlarını karşılaştırır.
SELECT i.lighting, d.model_name,
       ROUND(AVG(d.confidence), 2) AS ortalama_guven
FROM images i
JOIN detections d ON i.id = d.goruntu_id
GROUP BY i.lighting, d.model_name
ORDER BY i.lighting, d.model_name;
