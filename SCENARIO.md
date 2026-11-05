# Proje Senaryosu ve Hafta 3 Çalışması

## Hikâye
Bir meslek lisesi öğrencileri yaptığı robot kol projelerinde nesne tanıma için kamera kullanıyor. Öğretmen ekibi, iki farklı tespit modelinin öğrenci projelerindeki nesneleri nasıl tanıdığını karşılaştırmak istiyor[cite: 42].

## Ana Soru
Hangi model hangi nesne sınıfında daha doğru ve bu fark ışık koşuluna göre değişiyor mu?[cite: 42]

## Tablo Adayları
1. **images**: id, lighting, captured_at[cite: 42]
2. **detections**: id, goruntu_id, model_name, class, confidence[cite: 42]
3. **true_objects**: id, goruntu_id, class[cite: 42]

## YZ Bileşeni (Dönem Sonu)
Işık koşulu gibi bağlamsal değişkenleri kaydeden ve model performansını bu koşullara göre izleyen bir yapı[cite: 43].
