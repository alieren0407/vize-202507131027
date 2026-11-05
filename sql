-- Model ve sınıflara göre tespit sayıları ile ortalama güven skorunu hesaplar.
SELECT model_name, class, 
       COUNT(*) AS tespit_sayisi,
       ROUND(AVG(confidence), 2) AS ortalama_guven
FROM detections
GROUP BY model_name, class;
