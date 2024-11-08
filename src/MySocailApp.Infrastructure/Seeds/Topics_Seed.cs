using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.TopicAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds
{
    public class Topics_Seed : IEntityTypeConfiguration<Topic>
    {
        public void Configure(EntityTypeBuilder<Topic> builder)
        {
            builder
                .HasData(
                    [
                        //matematik
                        //kpss tyt ayt
                        new { Id = 1, Name = "Matematik Temel Kavramlar" },
                        new { Id = 2, Name = "Sayılar" },
                        new { Id = 3, Name = "Sayı Basamakları" },
                        new { Id = 4, Name = "Sayı Kümeleri" },
                        new { Id = 5, Name = "Doğal Sayılar" },
                        new { Id = 6, Name = "Tam Sayılar" },
                        new { Id = 7, Name = "Ondalık Sayılar" },
                        new { Id = 8, Name = "Sayma Sistemleri" },
                        new { Id = 9, Name = "Bölme" },
                        new { Id = 10, Name = "Bölünebilme Kuralları" },
                        new { Id = 11, Name = "EBOB – EKOK" },
                        new { Id = 12, Name = "Asal Çarpanlara Ayırma" },
                        new { Id = 13, Name = "Denklemler" },
                        new { Id = 14, Name = "Rasyonel Sayılar" },
                        new { Id = 15, Name = "Kesir ve Kesir Türleri" },
                        new { Id = 16, Name = "Rasyonel Sayılarda Dört İşlem" },
                        new { Id = 17, Name = "Basit Eşitsizlikler" },
                        new { Id = 18, Name = "Mutlak Değer" },
                        new { Id = 19, Name = "Üslü Sayılar" },
                        new { Id = 20, Name = "Köklü Sayılar" },
                        new { Id = 21, Name = "Çarpanlara Ayırma" },
                        new { Id = 22, Name = "Oran Orantı" },
                        new { Id = 23, Name = "Denklem Çözme" },
                        new { Id = 24, Name = "Problemler" },
                        new { Id = 25, Name = "Sayı Problemleri" },
                        new { Id = 26, Name = "Denklem Kurma Problemleri" },
                        new { Id = 27, Name = "Kesir Problemleri" },
                        new { Id = 28, Name = "Yaş Problemleri" },
                        new { Id = 29, Name = "Havuz Problemleri" },
                        new { Id = 30, Name = "Hareket Hız Problemleri" },
                        new { Id = 31, Name = "İşçi Emek Problemleri" },
                        new { Id = 32, Name = "Yüzde Problemleri" },
                        new { Id = 33, Name = "Kar Zarar Problemleri" },
                        new { Id = 34, Name = "Karışım Problemleri" },
                        new { Id = 35, Name = "Grafik Problemleri" },
                        new { Id = 36, Name = "Rutin Olmayan Problemler" },
                        new { Id = 37, Name = "Kümeler" },
                        new { Id = 38, Name = "Kartezyen Çarpım" },
                        new { Id = 39, Name = "İşlem - Modüler Aritmetik" },
                        new { Id = 40, Name = "Bağıntı ve Fonksiyon" },
                        new { Id = 41, Name = "Faktöriyel" },
                        new { Id = 42, Name = "Permütasyon" },
                        new { Id = 43, Name = "Kombinasyon" },
                        new { Id = 44, Name = "Olasılık" },
                        new { Id = 45, Name = "Tablo ve Grafikler" },
                        new { Id = 46, Name = "Tablo ve Yorumlama" },
                        new { Id = 47, Name = "Grafik ve Yorumlama" },
                        new { Id = 48, Name = "Sayısal Mantık" },
                        //tyt ayt
                        new { Id = 49, Name = "Mantık" },
                        new { Id = 50, Name = "Fonskiyonlar" },
                        new { Id = 51, Name = "Polinomlar" },
                        new { Id = 52, Name = "2.Dereceden Denklemler" },
                        new { Id = 53, Name = "Veri – İstatistik" },
                        //ayt
                        new { Id = 54, Name = "Karmaşık Sayılar" },
                        new { Id = 55, Name = "2.Dereceden Eşitsizlikler" },
                        new { Id = 56, Name = "Parabol" },
                        new { Id = 57, Name = "Trigonometri" },
                        new { Id = 58, Name = "Logaritma" },
                        new { Id = 59, Name = "Diziler" },
                        new { Id = 60, Name = "Limit" },
                        new { Id = 61, Name = "Türev" },
                        new { Id = 62, Name = "İntegral" },
                        //lgs
                        new { Id = 63, Name = "Çarpanlar ve Katlar" },
                        new { Id = 64, Name = "Üslü İfadeler" },
                        new { Id = 65, Name = "Kareköklü İfadeler" },
                        new { Id = 66, Name = "Veri Analizi" },
                        new { Id = 67, Name = "Basit Olayların Olma Olasılığı" },
                        new { Id = 68, Name = "Cebirsel İfadeler ve Özdeşlikler" },
                        new { Id = 69, Name = "Doğrusal Denklemler" },
                        new { Id = 70, Name = "Eşitsizlikler" },
                        new { Id = 71, Name = "Üçgenler" },
                        new { Id = 72, Name = "Eşlik ve Benzerlik" },
                        new { Id = 73, Name = "Geometrik Cisimler" },
                        new { Id = 74, Name = "Dönüşüm Geometrisi" },

                        //Biyoloji
                        new { Id = 1001, Name = "Canlıların Ortak Özellikleri" },
                        new { Id = 1002, Name = "Canlıların Temel Bileşenleri" },
                        new { Id = 1003, Name = "Hücre ve Organeller – Madde Geçişleri" },
                        new { Id = 1004, Name = "Canlıların Sınıflandırılması" },
                        new { Id = 1005, Name = "Hücrede Bölünme – Üreme" },
                        new { Id = 1006, Name = "Kalıtım" },
                        new { Id = 1007, Name = "Bitki Biyolojisi" },
                        new { Id = 1008, Name = "Ekosistem" },
                        new { Id = 1009, Name = "Sinir Sistemi" },
                        new { Id = 1010, Name = "Endokrin Sistem ve Hormonlar" },
                        new { Id = 1011, Name = "Duyu Organları" },
                        new { Id = 1012, Name = "Destek ve Hareket Sistemi" },
                        new { Id = 1013, Name = "Sindirim Sistemi" },
                        new { Id = 1014, Name = "Dolaşım ve Bağışıklık Sistemi" },
                        new { Id = 1015, Name = "Solunum Sistemi" },
                        new { Id = 1016, Name = "Boşaltım Sistemi" },
                        new { Id = 1017, Name = "Üreme Sistemi ve Embriyonik Gelişim" },
                        new { Id = 1018, Name = "Komünite Ekolojisi" },
                        new { Id = 1019, Name = "Popülasyon Ekolojisi" },
                        new { Id = 1020, Name = "Genden Proteine" },
                        new { Id = 1021, Name = "Nükleik Asitler" },
                        new { Id = 1022, Name = "Genetik Şifre ve Protein Sentezi" },
                        new { Id = 1023, Name = "Canlılarda Enerji Dönüşümleri" },
                        new { Id = 1024, Name = "Canlılık ve Enerji" },
                        new { Id = 1025, Name = "Fotosentez" },
                        new { Id = 1026, Name = "Kemosentez" },
                        new { Id = 1027, Name = "Hücresel Solunum" },
                        new { Id = 1028, Name = "Bitki Biyolojisi" },
                        new { Id = 1029, Name = "Canlılar ve Çevre" },

                        //Cografya
                        //kpass
                        new { Id = 2001, Name = "Türkiye'nin Coğrafi Konumu" },
                        new { Id = 2002, Name = "Türkiye'nin Coğrafi Konumu - Matematik (Mutlak) Konum" },
                        new { Id = 2003, Name = "Türkiye'nin Coğrafi Konumu - Türkiye'nin Matematik (Mutlak) Konumu ve Sonuçları" },
                        new { Id = 2004, Name = "Türkiye'nin Coğrafi Konumu - Türkiye'nin Özel (Göreceli) Konumu ve Sonuçları" },
                        new { Id = 2005, Name = "Türkiye'nin Coğrafi Konumu - Türkiye'nin Jeopolitiği" },
                        new { Id = 2006, Name = "Türkiye'nin Yerşekilleri ve Özellikleri" },
                        new { Id = 2007, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Yerşekillerinin Genel Özellikleri" },
                        new { Id = 2008, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Fiziki Haritalar" },
                        new { Id = 2009, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Jeolojik Geçmişi" },
                        new { Id = 2010, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Platoları ve Ovaları" },
                        new { Id = 2011, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'de Dış Güçlerin Oluşturduğu Yer Şekilleri" },
                        new { Id = 2012, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Kıyı Tipleri" },
                        new { Id = 2013, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'de Toprak Oluşumu ve Tipleri" },
                        new { Id = 2014, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Su Varlığı" },
                        new { Id = 2015, Name = "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'de Doğal Afetler" },
                        new { Id = 2016, Name = "Türkiye'nin İklimi ve Bitki Örtüsü" },
                        new { Id = 2017, Name = "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'nin İklimi" },
                        new { Id = 2018, Name = "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'de Sıcaklık" },
                        new { Id = 2019, Name = "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'de Nemlilik ve Yağış" },
                        new { Id = 2020, Name = "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'de İklim Tipleri" },
                        new { Id = 2021, Name = "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'nin Bitki Örtüsü" },
                        new { Id = 2022, Name = "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'nin İklim Tipleri ve Bitki Örtüsü" },
                        new { Id = 2023, Name = "Türkiye'de Nüfus ve Yerleşme" },
                        new { Id = 2024, Name = "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Nüfus Özellikleri" },
                        new { Id = 2025, Name = "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Nüfusun Dağılışı ve Nüfus Yoğunluğu" },
                        new { Id = 2026, Name = "Türkiye'de Nüfus ve Yerleşme - Türkiye'nin Nüfusu ve Nüfus Sayımları" },
                        new { Id = 2027, Name = "Türkiye'de Nüfus ve Yerleşme - Türkiye'nin Nüfus Politikaları" },
                        new { Id = 2028, Name = "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Nüfus Projeksiyonları: Türkiye Nüfusunun Geleceği" },
                        new { Id = 2029, Name = "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Göçler" },
                        new { Id = 2030, Name = "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Yerleşme" },
                        new { Id = 2031, Name = "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Mesken Tipleri" },
                        new { Id = 2032, Name = "Türkiye'de Tarım, Hayvancılık ve Ormancılık" },
                        new { Id = 2033, Name = "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Anadolu Uygarlıkları" },
                        new { Id = 2034, Name = "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye'de Arazi Kullanımı" },
                        new { Id = 2035, Name = "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye Ekonomisinin Sektörel Dağılımı" },
                        new { Id = 2036, Name = "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye Ekonomisini Etkileyen Faktörler" },
                        new { Id = 2037, Name = "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye'de Tarım" },
                        new { Id = 2038, Name = "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye'de Hayvancılık" },
                        new { Id = 2039, Name = "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye'de Ormancılık" },
                        new { Id = 2040, Name = "Türkiye'de Madenler, Enerji Kaynakları ve Sanayi" },
                        new { Id = 2041, Name = "Türkiye'de Madenler, Enerji Kaynakları ve Sanayi - Türkiye'de Madenler" },
                        new { Id = 2042, Name = "Türkiye'de Madenler, Enerji Kaynakları ve Sanayi - Türkiye'de Enerji Kaynakları" },
                        new { Id = 2043, Name = "Türkiye'de Madenler, Enerji Kaynakları ve Sanayi - Türkiye'de Sanayi" },
                        new { Id = 2044, Name = "Türkiye'de Ulaşım, Ticaret ve Turizm" },
                        new { Id = 2045, Name = "Türkiye'de Ulaşım, Ticaret ve Turizm - Türkiye'de Ulaşım" },
                        new { Id = 2046, Name = "Türkiye'de Ulaşım, Ticaret ve Turizm - Türkiye'de Ticaret" },
                        new { Id = 2047, Name = "Türkiye'de Ulaşım, Ticaret ve Turizm - Türkiye'de Turizm" },
                        new { Id = 2048, Name = "Türkiye'de Ulaşım, Ticaret ve Turizm - Türkiye'nin Millî Parkları Türkiye’de Şehirler ve Özellikleri" },
                        new { Id = 2049, Name = "Türkiye'nin Coğrafi Bölgeleri" },
                        new { Id = 2050, Name = "Türkiye'nin Coğrafi Bölgeleri - Türkiye'de Bölge Sınıflandırması" },
                        new { Id = 2051, Name = "Türkiye'nin Coğrafi Bölgeleri - Türkiye'nin Bölgesel Kalkınma Projeleri" },
                        new { Id = 2052, Name = "Türkiye'nin Coğrafi Bölgeleri - Türkiye'nin Coğrafi Bölgeleri" },
                        new { Id = 2053, Name = "Türkiye'nin Coğrafi Bölgeleri - Karadeniz Bölgesi" },
                        new { Id = 2054, Name = "Türkiye'nin Coğrafi Bölgeleri - Marmara Bölgesi" },
                        new { Id = 2055, Name = "Türkiye'nin Coğrafi Bölgeleri - Ege Bölgesi" },
                        new { Id = 2056, Name = "Türkiye'nin Coğrafi Bölgeleri - Akdeniz Bölgesi" },
                        new { Id = 2057, Name = "Türkiye'nin Coğrafi Bölgeleri - İç Anadolu Bölgesi" },
                        new { Id = 2058, Name = "Türkiye'nin Coğrafi Bölgeleri - Doğu Anadolu Bölgesi" },
                        new { Id = 2059, Name = "Türkiye'nin Coğrafi Bölgeleri - Güneydoğu Anadolu Bölgesi" },
                        new { Id = 2060, Name = "Türkiye'nin Coğrafi Bölgeleri - Bölgelerin Özelliklerinin Karşılaştırılması" },
                        //tyt
                        new { Id = 2061, Name = "Doğa ve İnsan" },
                        new { Id = 2062, Name = "Dünya’nın Şekli ve Hareketleri" },
                        new { Id = 2063, Name = "Coğrafi Konum" },
                        new { Id = 2064, Name = "Harita Bilgisi" },
                        new { Id = 2065, Name = "Atmosfer ve Sıcaklık" },
                        new { Id = 2066, Name = "İklimler" },
                        new { Id = 2067, Name = "Basınç ve Rüzgarlar" },
                        new { Id = 2068, Name = "Nem, Yağış ve Buharlaşma" },
                        new { Id = 2069, Name = "İç Kuvvetler / Dış Kuvvetler" },
                        new { Id = 2070, Name = "Su – Toprak ve Bitkiler" },
                        new { Id = 2071, Name = "Nüfus" },
                        new { Id = 2072, Name = "Göç" },
                        new { Id = 2073, Name = "Yerleşme" },
                        new { Id = 2074, Name = "Türkiye’nin Yer Şekilleri" },
                        new { Id = 2075, Name = "Ekonomik Faaliyetler" },
                        new { Id = 2076, Name = "Bölgeler" },
                        new { Id = 2077, Name = "Uluslararası Ulaşım Hatları" },
                        new { Id = 2078, Name = "Çevre ve Toplum" },
                        new { Id = 2079, Name = "Doğal Afetler" },
                        //ayt
                        new { Id = 2080, Name = "Ekosistem" },
                        new { Id = 2081, Name = "Biyoçeşitlilik" },
                        new { Id = 2082, Name = "Biyomlar" },
                        new { Id = 2083, Name = "Ekosistemin Unsurları" },
                        new { Id = 2084, Name = "Enerji Akışı ve Madde Döngüsü" },
                        new { Id = 2085, Name = "Ekstrem Doğa Olayları" },
                        new { Id = 2086, Name = "Küresel İklim Değişimi" },
                        new { Id = 2087, Name = "Nüfus Politikaları" },
                        new { Id = 2088, Name = "Türkiye'de Nüfus ve Yerleşme" },
                        new { Id = 2089, Name = "Ekonomik Faaliyetler ve Doğal Kaynaklar" },
                        new { Id = 2090, Name = "Göç ve Şehirleşme" },
                        new { Id = 2091, Name = "Türkiye Ekonomisi" },
                        new { Id = 2092, Name = "Türkiye'nin Ekonomi Politikaları" },
                        new { Id = 2093, Name = "Türkiye Ekonomisinin Sektörel Dağılımı" },
                        new { Id = 2094, Name = "Türkiye'de Tarım" },
                        new { Id = 2095, Name = "Türkiye'de Hayvancılık" },
                        new { Id = 2096, Name = "Türkiye'de Madenler ve Enerji Kaynakları" },
                        new { Id = 2097, Name = "Türkiye'de Sanayi" },
                        new { Id = 2098, Name = "Türkiye'de Ulaşım" },
                        new { Id = 2099, Name = "Türkiye'de Ticaret ve Turizm" },
                        new { Id = 2100, Name = "Geçmişten Geleceğe Şehir ve Ekonomi" },
                        new { Id = 2101, Name = "Türkiye'nin İşlevsel Bölgeleri ve Kalkınma Projeleri" },
                        new { Id = 2102, Name = "Hizmet Sektörünün Ekonomideki Yeri" },
                        new { Id = 2103, Name = "Küresel Ticaret" },
                        new { Id = 2104, Name = "Bölgeler ve Ülkeler" },
                        new { Id = 2105, Name = "İlk Uygarlıklar" },
                        new { Id = 2106, Name = "Kültür Bölgeleri ve Türk Kültürü" },
                        new { Id = 2107, Name = "Sanayileşme Süreci: Almanya" },
                        new { Id = 2108, Name = "Tarım ve Ekonomi İlişkisi Fransa – Somali" },
                        new { Id = 2109, Name = "Ülkeler Arası Etkileşim" },
                        new { Id = 2110, Name = "Jeopolitik Konum" },
                        new { Id = 2111, Name = "Çatışma Bölgeleri" },
                        new { Id = 2112, Name = "Küresel ve Bölgesel Örgütler" },
                        new { Id = 2113, Name = "Çevre ve Toplum" },
                        new { Id = 2114, Name = "Çevre Sorunları ve Türleri" },
                        new { Id = 2115, Name = "Madenler ve Enerji Kaynaklarının Çevreye Etkisi" },
                        new { Id = 2116, Name = "Doğal Kaynakların Sürdürülebilir Kullanımı" },
                        new { Id = 2117, Name = "Ekolojik Ayak İzi" },
                        new { Id = 2118, Name = "Doğal Çevrenin Sınırlılığı" },
                        new { Id = 2119, Name = "Çevre Politikaları" },
                        new { Id = 2120, Name = "Çevresel Örgütler" },
                        new { Id = 2121, Name = "Çevre Anlaşmaları" },
                        new { Id = 2122, Name = "Doğal Afetler" },
                        
                        //din kulturu
                        new { Id = 3001, Name = "İnanç" },
                        new { Id = 3002, Name = "İbadet" },
                        new { Id = 3003, Name = "Ahlak ve Değerler" },
                        new { Id = 3004, Name = "Din, Kültür ve Medniyet" },
                        new { Id = 3005, Name = "Hz. Mhammed (S.A.V.)" },
                        new { Id = 3006, Name = "Vahiy ve Akıl" },
                        new { Id = 3007, Name = "Dünya ve Ahiret" },
                        new { Id = 3008, Name = "Kur'an'a göre Hz. Muhammed (S.A.V.)" },
                        new { Id = 3009, Name = "İnançla İlgili Meseleler" },
                        new { Id = 3010, Name = "Yahudilik ve Hristiyanlık" },
                        new { Id = 3011, Name = "İslam ve Bilim" },
                        new { Id = 3012, Name = "Anadolu da İslam" },
                        new { Id = 3013, Name = "İslam Düşüncesinde Tasavvufi Yorumlar" },
                        new { Id = 3014, Name = "Güncel Dini Meseler" },
                        new { Id = 3015, Name = "Hint ve Çin Dinleri" },
                        new { Id = 3016, Name = "Kur'an'da Bazı Kavramlar" },
                        new { Id = 3017, Name = "Kader İnancı" },
                        new { Id = 3018, Name = "Zekat ve Sadaka" },
                        new { Id = 3019, Name = "Din ve Hayat" },
                        new { Id = 3020, Name = "Hz. Muhammed'in Örnekliği" },
                        new { Id = 3021, Name = "Kur'an-ı Kerim ve Özellikleri" },

                        //felsefe
                        new { Id = 4001, Name = "Felsefenin Konusu" },
                        new { Id = 4002, Name = "Bilgi Felsefesi" },
                        new { Id = 4003, Name = "Varlık Felsefesi" },
                        new { Id = 4004, Name = "Din, Kültür ve Medniyet" },
                        new { Id = 4005, Name = "Ahlak Felsefesi" },
                        new { Id = 4006, Name = "Sanat Felsefesi" },
                        new { Id = 4007, Name = "Din Felsefesi" },
                        new { Id = 4008, Name = "Siyaset Felsefesi" },
                        new { Id = 4009, Name = "Bilim Felsefesi" },
                        new { Id = 4010, Name = "İlk Çağ Felsefesi" },
                        new { Id = 4011, Name = "MÖ 6. Yüzyıl – MS 2. Yüzyıl Felsefesi" },
                        new { Id = 4012, Name = "MS 2. Yüzyıl – MS 15. Yüzyıl Felsefesi" },
                        new { Id = 4013, Name = "15. Yüzyıl – 17. Yüzyıl Felsefesi" },
                        new { Id = 4014, Name = "18. Yüzyıl – 19. Yüzyıl Felsefesi" },
                        new { Id = 4015, Name = "20. Yüzyıl Felsefesi" },


                        //fizik
                        new { Id = 5001, Name = "Fizik Bilimine Giriş" },
                        new { Id = 5002, Name = "Madde Ve Özellikleri" },
                        new { Id = 5003, Name = "Kaldırma Kuvveti" },
                        new { Id = 5004, Name = "Basınç" },
                        new { Id = 5005, Name = "Isı, Sıcaklık ve Genleşme" },
                        new { Id = 5006, Name = "Hareket ve Kuvvet" },
                        new { Id = 5007, Name = "Dinamik" },
                        new { Id = 5008, Name = "İş, Güç ve Enerji" },
                        new { Id = 5009, Name = "Elektrostatik" },
                        new { Id = 5010, Name = "Elektrik Akımı ve Devreler" },
                        new { Id = 5011, Name = "Elektriksel Enerji ve Güç" },
                        new { Id = 5012, Name = "Optik" },
                        new { Id = 5013, Name = "Manyetizma" },
                        new { Id = 5014, Name = "Dalgalar" },
                        new { Id = 5015, Name = "Vektörler" },
                        new { Id = 5016, Name = "Kuvvet, Tork ve Denge" },
                        new { Id = 5017, Name = "Kütle Merkezi" },
                        new { Id = 5018, Name = "Basit Makineler" },
                        new { Id = 5019, Name = "Hareket" },
                        new { Id = 5020, Name = "Newton’un Hareket Yasaları" },
                        new { Id = 5021, Name = "İş, Güç ve Enerji II" },
                        new { Id = 5022, Name = "Atışlar" },
                        new { Id = 5023, Name = "İtme ve Momentum" },
                        new { Id = 5024, Name = "Elektrik Alan ve Potansiyel" },
                        new { Id = 5025, Name = "Paralel Levhalar ve Sığa" },
                        new { Id = 5026, Name = "Manyetik Alan ve Manyetik Kuvvet" },
                        new { Id = 5027, Name = "İndüksiyon, Alternatif Akım ve Transformatörler" },
                        new { Id = 5028, Name = "Çembersel Hareket" },
                        new { Id = 5029, Name = "Dönme, Yuvarlanma ve Açısal Momentum" },
                        new { Id = 5030, Name = "Kütle Çekim ve Kepler Yasaları" },
                        new { Id = 5031, Name = "Basit Harmonik Hareket" },
                        new { Id = 5032, Name = "Dalga Mekaniği ve Elektromanyetik Dalgalar" },
                        new { Id = 5033, Name = "Atom Modelleri" },
                        new { Id = 5034, Name = "Büyük Patlama ve Parçacık Fiziği" },
                        new { Id = 5035, Name = "Radyoaktivite" },
                        new { Id = 5036, Name = "Özel Görelilik" },
                        new { Id = 5037, Name = "Kara Cisim Işıması" },
                        new { Id = 5038, Name = "Fotoelektrik Olay ve Compton Olayı" },
                        new { Id = 5039, Name = "Modern Fiziğin Teknolojideki Uygulamaları" },

                        //geometri
                        new { Id = 6001, Name = "Geometrik Kavramlar" },
                        new { Id = 6002, Name = "Doğruda Açılar" },
                        new { Id = 6003, Name = "Üçgende Açılar" },
                        new { Id = 6004, Name = "Üçgende Eşlik ve Benzerlik" },
                        new { Id = 6005, Name = "Özel Üçgenler" },
                        new { Id = 6006, Name = "Dik Üçgen" },
                        new { Id = 6007, Name = "İkizkenar Üçgen" },
                        new { Id = 6008, Name = "Eşkenar Üçgen" },
                        new { Id = 6009, Name = "Açıortay" },
                        new { Id = 6010, Name = "Kenarortay" },
                        new { Id = 6011, Name = "Eşlik ve Benzerlik" },
                        new { Id = 6012, Name = "Üçgende Alan" },
                        new { Id = 6013, Name = "Üçgende Benzerlik" },
                        new { Id = 6014, Name = "Üçgende Açı Kenar Bağıntıları" },
                        new { Id = 6015, Name = "Çokgenler" },
                        new { Id = 6016, Name = "Özel Dörtgenler" },
                        new { Id = 6017, Name = "Dörtgenler" },
                        new { Id = 6018, Name = "Deltoid" },
                        new { Id = 6019, Name = "Paralelkenar" },
                        new { Id = 6020, Name = "Eşkenar Dörtgen" },
                        new { Id = 6021, Name = "Dikdörtgen" },
                        new { Id = 6022, Name = "Kare" },
                        new { Id = 6023, Name = "Yamuk" },
                        new { Id = 6024, Name = "Çember ve Daire" },
                        new { Id = 6025, Name = "Çemberde Açı" },
                        new { Id = 6026, Name = "Çemberde Uzunluk" },
                        new { Id = 6027, Name = "Dairede Çevre ve Alan" },
                        new { Id = 6028, Name = "Analitik Geometri" },
                        new { Id = 6029, Name = "Noktanın Anzalitiği" },
                        new { Id = 6030, Name = "Analitik Düzlem" },
                        new { Id = 6031, Name = "Doğrunun Grafiğinin Çizimi" },
                        new { Id = 6032, Name = "Doğrunun Denklemleri" },
                        new { Id = 6033, Name = "Doğrunun Analitiği" },
                        new { Id = 6034, Name = "Simetriler" },
                        new { Id = 6035, Name = "Eşitsizlikler" },
                        new { Id = 6036, Name = "Dönüşüm Geometrisi" },
                        new { Id = 6037, Name = "Katı Cisimler" },
                        new { Id = 6038, Name = "Prizmalar" },
                        new { Id = 6039, Name = "Dikdörtgenler Prizmalar" },
                        new { Id = 6040, Name = "Küp" },
                        new { Id = 6041, Name = "Silindir" },
                        new { Id = 6042, Name = "Dönel Silindir" },
                        new { Id = 6043, Name = "Kesik Piramit" },
                        new { Id = 6044, Name = "Piramit" },
                        new { Id = 6045, Name = "Koni" },
                        new { Id = 6046, Name = "Küre" },
                        new { Id = 6047, Name = "Çemberin Analitiği" },

                        //kimya
                        new { Id = 7001, Name = "Kimya Bilimi" },
                        new { Id = 7002, Name = "Atom ve Yapısı" },
                        new { Id = 7003, Name = "Periyodik Sistem" },
                        new { Id = 7004, Name = "Kimyasal Türler Arası Etkileşimler" },
                        new { Id = 7005, Name = "Maddenin Halleri" },
                        new { Id = 7006, Name = "Kimyanın Temel Kanunları" },
                        new { Id = 7007, Name = "Asitler, Bazlar ve Tuzlar" },
                        new { Id = 7008, Name = "Kimyasal Hesaplamalar" },
                        new { Id = 7009, Name = "Karışımlar" },
                        new { Id = 7010, Name = "Endüstride ve Canlılarda Enerji" },
                        new { Id = 7011, Name = "Kimya Her Yerde" },
                        new { Id = 7012, Name = "Modern Atom Teorisi." },
                        new { Id = 7013, Name = "Gazlar" },
                        new { Id = 7014, Name = "Sıvı Çözeltiler ve Çözünürlük." },
                        new { Id = 7015, Name = "Kimyasal Tepkimelerde Enerji" },
                        new { Id = 7016, Name = "Kimyasal Tepkimelerde Hız" },
                        new { Id = 7017, Name = "Kimyasal Tepkimelerde Denge" },
                        new { Id = 7018, Name = "Asit-Baz Dengesi" },
                        new { Id = 7019, Name = "Çözünürlük Dengesi" },
                        new { Id = 7020, Name = "Kimya ve Elektrik" },
                        new { Id = 7021, Name = "Organik Kimyaya Giriş" },
                        new { Id = 7022, Name = "Organik Kimya" },
                        new { Id = 7023, Name = "Hidrokarbonlar" },
                        new { Id = 7024, Name = "Fonksiyonel Gruplar" },
                        new { Id = 7025, Name = "Enerji Kaynakları ve Bilimsel Gelişmeler" },

                        //tarih
                        //kpss
                        new { Id = 8001, Name = "İslamiyet Öncesi Türk Tarihi" },
                        new { Id = 8002, Name = "İlk Türk - İslam Devletleri ve Beylikleri" },
                        new { Id = 8003, Name = "Osmanlı Devleti Kuruluş ve Yükselme Dönemleri" },
                        new { Id = 8004, Name = "Osmanlı Devleti’nde Kültür ve Uygarlık" },
                        new { Id = 8005, Name = "XVII. Yüzyılda Osmanlı Devleti (Duraklama Dönemi)" },
                        new { Id = 8006, Name = "XVIII. Yüzyılda Osmanlı Devleti (Gerileme Dönemi)" },
                        new { Id = 8007, Name = "XIX. Yüzyılda Osmanlı Devleti (Dağılma Dönemi)" },
                        new { Id = 8008, Name = "XX. Yüzyılda Osmanlı Devleti" },
                        new { Id = 8009, Name = "Kurtuluş Savaşı Hazırlık Dönemi" },
                        new { Id = 8010, Name = "I. TBMM Dönemi" },
                        new { Id = 8011, Name = "Kurtuluş Savaşı Muharebeler Dönemi" },
                        new { Id = 8012, Name = "Atatürk İnkılapları" },
                        new { Id = 8013, Name = "Atatürk İlkeleri" },
                        new { Id = 8014, Name = "Partiler ve Partileşme Dönemi (İç Politika)" },
                        new { Id = 8015, Name = "Atatürk Dönemi Türk Dış Politikası" },
                        new { Id = 8016, Name = "Atatürk Sonrası Dönem" },
                        new { Id = 8017, Name = "Atatürk’ün Hayatı ve Kişiliği" },
                        //tyt + ayt
                        new { Id = 8018, Name = "Tarih ve Zaman" },
                        new { Id = 8019, Name = "İnsanlığın İlk Dönemleri" },
                        new { Id = 8020, Name = "Ortaçağ’da Dünya" },
                        new { Id = 8021, Name = "İlk ve Orta Çağlarda Türk Dünyası" },
                        new { Id = 8022, Name = "İslam Medeniyetinin Doğuşu" },
                        new { Id = 8023, Name = "Türklerin İslamiyet’i Kabulü ve İlk Türk İslam Devletleri" },
                        new { Id = 8024, Name = "Yerleşme ve Devletleşme Sürecinde Selçuklu Türkiyesi" },
                        new { Id = 8025, Name = "Beylikten Devlete Osmanlı Siyaseti" },
                        new { Id = 8026, Name = "Devletleşme Sürecinde Savaşçılar ve Askerler" },
                        new { Id = 8027, Name = "Dünya Gücü Osmanlı Devleti" },
                        //tyt
                        new { Id = 8028, Name = "Yeni Çağ Avrupa Tarihi" },
                        new { Id = 8029, Name = "Yakın Çağ Avrupa Tarihi" },
                        new { Id = 8030, Name = "Osmanlı Devletinde Arayış Yılları" },
                        new { Id = 8031, Name = "18. Yüzyılda Değişim ve Diplomasi" },
                        new { Id = 8032, Name = "En Uzun Yüzyıl" },
                        new { Id = 8033, Name = "Osmanlı Kültür ve Medeniyeti" },
                        new { Id = 8034, Name = "20. Yüzyılda Osmanlı Devleti" },
                        new { Id = 8035, Name = "I. Dünya Savaşı" },
                        new { Id = 8036, Name = "Mondros Ateşkesi, İşgaller ve Cemiyetler" },
                        new { Id = 8037, Name = "Kurtuluş Savaşına Hazırlık Dönemi" },
                        new { Id = 8038, Name = "I. TBMM Dönemi" },
                        new { Id = 8039, Name = "Kurtuluş Savaşı ve Antlaşmalar" },
                        new { Id = 8040, Name = "II. TBMM Dönemi ve Çok Partili Hayata Geçiş" },
                        new { Id = 8041, Name = "Türk İnkılabı" },
                        new { Id = 8042, Name = "Atatürk İlkeleri" },
                        new { Id = 8043, Name = "Atatürk Dönemi Türk Dış Politikası" },
                        //ayt
                        new { Id = 8044, Name = "Sultan ve Osmanlı Merkez Teşkilatı" },
                        new { Id = 8045, Name = "Klasik Çağda Osmanlı Toplum Düzeni" },
                        new { Id = 8046, Name = "Değişen Dünya Dengeleri Karşısında Osmanlı Siyaseti" },
                        new { Id = 8047, Name = "Değişim Çağında Avrupa ve Osmanlı" },
                        new { Id = 8048, Name = "Uluslararası İlişkilerde Denge Stratejisi (1774-1914)" },
                        new { Id = 8049, Name = "Devrimler Çağında Değişen Devlet-Toplum İlişkileri" },
                        new { Id = 8050, Name = "Sermaye ve Emek" },
                        new { Id = 8051, Name = "XIX. ve XX. Yüzyılda Değişen Gündelik Hayat" },
                        new { Id = 8052, Name = "XX. Yüzyıl Başlarında Osmanlı Devleti ve Dünya" },
                        new { Id = 8053, Name = "Milli Mücadele" },
                        new { Id = 8054, Name = "Atatürkçülük ve Türk İnkılabı" },
                        new { Id = 8055, Name = "İki Savaş Arasındaki Dönemde Türkiye ve Dünya" },
                        new { Id = 8056, Name = "II. Dünya Savaşı Sürecinde Türkiye ve Dünya" },
                        new { Id = 8057, Name = "II. Dünya Savaşı Sonrasında Türkiye ve Dünya" },
                        new { Id = 8058, Name = "Toplumsal Devrim Çağında Dünya ve Türkiye" },
                        new { Id = 8059, Name = "XXI. Yüzyılın Eşiğinde Türkiye ve Dünya" },

                        //turkce
                        new { Id = 9001, Name = "Sözcükte Anlam" },
                        new { Id = 9002, Name = "Sözcükte Anlam - Söz Öbekleri" },
                        new { Id = 9003, Name = "Söz Sanatları" },
                        new { Id = 9004, Name = "Sözcükte Yapı" },
                        new { Id = 9005, Name = "Sözcük Türleri" },
                        new { Id = 9006, Name = "Sözcük Türleri - Ad (İsim)" },
                        new { Id = 9007, Name = "Sözcük Türleri - Adıl (Zamir)" },
                        new { Id = 9008, Name = "Sözcük Türleri - Önad (Sıfat)" },
                        new { Id = 9009, Name = "Sözcük Türleri - Belirteç (Zarf)" },
                        new { Id = 9010, Name = "Sözcük Türleri - İlgeç (Edat)" },
                        new { Id = 9011, Name = "Sözcük Türleri - Bağlaç" },
                        new { Id = 9012, Name = "Sözcük Türleri - Ünlem" },
                        new { Id = 9013, Name = "Sözcük Türleri - Fiil (Eylem)" },
                        new { Id = 9014, Name = "Cümlede Anlam" },
                        new { Id = 9015, Name = "Cümle yorumlama"},
                        new { Id = 9016, Name = "Paragrafta (Parçada) Anlam" },
                        new { Id = 9017, Name = "Paragrafta Anlam - Paragrafın Ana Düşüncesi" },
                        new { Id = 9018, Name = "Paragrafta Anlam - Paragrafta Yardımcı Düşünceler" },
                        new { Id = 9019, Name = "Paragrafta Anlam - Paragrafın Konusu" },
                        new { Id = 9020, Name = "Paragrafta Anlam - Paragrafın Başlığı" },
                        new { Id = 9021, Name = "Paragrafta Anlam - Paragrafın Anahtar Kelimesi" },
                        new { Id = 9022, Name = "Paragrafta Anlam - Paragraf Tamamlama" },
                        new { Id = 9023, Name = "Paragrafta Anlam - Paragrafı İkiye Bölme" },
                        new { Id = 9024, Name = "Paragrafta Anlam - Paragrafın Akışını Bozan Cümle" },
                        new { Id = 9025, Name = "Paragrafta Anlam - Paragrata Anlatım Teknikleri" },
                        new { Id = 9026, Name = "Paragrafta Anlam - Paragrata Düşünceyi Geliştirme Yolları" },
                        new { Id = 9027, Name = "Paragrafta Anlam - Paragrafın Anlatıcı Bakış Açıları" },
                        new { Id = 9028, Name = "Yazım Kuralları" },
                        new { Id = 9029, Name = "Yazım Kuralları - Büyük Harflerin Yazımı" },
                        new { Id = 9030, Name = "Yazım Kuralları - Küçük Harf Yazımı" },
                        new { Id = 9031, Name = "Yazım Kuralları - Kelime ve Söz Gruplarının Yazımı" },
                        new { Id = 9032, Name = "Yazım Kuralları - Bağlaçların Yazımı" },
                        new { Id = 9033, Name = "Yazım Kuralları - Kısaltmaların Yazımı" },
                        new { Id = 9034, Name = "Yazım Kuralları - Sayıların Yazımı" },
                        new { Id = 9035, Name = "Yazım Kuralları - Yabancı Kelimelerin Yazımı" },
                        new { Id = 9036, Name = "Yazım Kuralları - Özel İsimlerin Yazımı" },
                        new { Id = 9037, Name = "Yazım Kuralları - Birleşik Kelimelerin Yazımı" },
                        new { Id = 9038, Name = "Yazım Kuralları - Bitişik Yazılan Birleşik Kelimeler" },
                        new { Id = 9039, Name = "Yazım Kuralları - Ayrı Yazılan Birleşik Kelimeler" },
                        new { Id = 9040, Name = "Yazım Kuralları - \"de/da\" Bağlacının Yazımı" },
                        new { Id = 9041, Name = "Yazım Kuralları - \"ki\" Bağlacının Yazımı" },
                        new { Id = 9042, Name = "Yazım Kuralları - \"mi\" ” Soru Ekinin Yazımı" },
                        new { Id = 9043, Name = "Yazım Kuralları - \"ne … ne …\" Bağlacının Yazımı" },
                        new { Id = 9044, Name = "Yazım Kuralları - Pekiştirmelerin Yazımı" },
                        new { Id = 9045, Name = "Yazım Kuralları - İkilemelerin Yazımı" },
                        new { Id = 9046, Name = "Metin Türleri (Edebi Türler)"},
                        new { Id = 9047, Name = "Ses Bilgisi" },
                        new { Id = 9048, Name = "Ses Bilgisi - Ses Olayları" },
                        new { Id = 9049, Name = "Ses Bilgisi - Ünsüz Sertleşmesi (Ünsüz Benzeşmesi)" },
                        new { Id = 9050, Name = "Ses Bilgisi - Ünsüz Yumuşaması (Sessiz Yumuşaması)" },
                        new { Id = 9051, Name = "Ses Bilgisi - Ses Düşmesi" },
                        new { Id = 9052, Name = "Ses Bilgisi - Ünlü Düşmesi" },
                        new { Id = 9053, Name = "Ses Bilgisi - Ünsüz Düşmesi" },
                        new { Id = 9054, Name = "Ses Bilgisi - Ses Türemesi" },
                        new { Id = 9055, Name = "Ses Bilgisi - Ünlü Türemesi" },
                        new { Id = 9056, Name = "Ses Bilgisi - Ünsüz Türemesi" },
                        new { Id = 9057, Name = "Ses Bilgisi - Ünlü Daralması" },
                        new { Id = 9058, Name = "Ses Bilgisi - Ulama" },
                        new { Id = 9059, Name = "Ses Bilgisi - Kaynaşma" },
                        new { Id = 9060, Name = "Ses Bilgisi - Ünlü Uyumları" },
                        new { Id = 9061, Name = "Noktalama İşaretleri" },
                        new { Id = 9062, Name = "Noktalama İşaretleri - Nokta \".\"" },
                        new { Id = 9063, Name = "Noktalama İşaretleri - Virgül \",\"" },
                        new { Id = 9064, Name = "Noktalama İşaretleri - Noktalı Virgül \";\"" },
                        new { Id = 9065, Name = "Noktalama İşaretleri - İki Nokta \":\"" },
                        new { Id = 9066, Name = "Noktalama İşaretleri - Üç Nokta \"...\"" },
                        new { Id = 9067, Name = "Noktalama İşaretleri - Soru İşareti \"?\"" },
                        new { Id = 9068, Name = "Noktalama İşaretleri - Ünlem İşareti \"!\"" },
                        new { Id = 9069, Name = "Noktalama İşaretleri - Tırnak İşareti \"” “\"" },
                        new { Id = 9070, Name = "Noktalama İşaretleri - Kesme İşareti \"'\"" },
                        new { Id = 9071, Name = "Anlatım Bozuklukları" },
                        new { Id = 9072, Name = "Fiilimsiler (Eylemsiler)" },
                        new { Id = 9073, Name = "Fiilimsiler (Eylemsiler) - İsim Fiil (Mastar)" },
                        new { Id = 9074, Name = "Fiilimsiler (Eylemsiler) - Sıfat Fiil (Ortaç)" },
                        new { Id = 9075, Name = "Fiilimsiler (Eylemsiler) - Zarf-Fiil (Ulaç)" },
                        new { Id = 9076, Name = "Fiilde (Eylemde) Çatı" },
                        new { Id = 9077, Name = "Fiiller" },
                        new { Id = 9078, Name = "Fiiller - Anlamlarına Göre Fiiller" },
                        new { Id = 9079, Name = "Fiiller - Yapılarına Göre Fiiller" },
                        new { Id = 9080, Name = "Fiiller - İş (Kılış) Fiilleri" },
                        new { Id = 9081, Name = "Fiiller - Durum Fiilleri" },
                        new { Id = 9082, Name = "Fiiller - Oluş Fiilleri" },
                        new { Id = 9083, Name = "Fiiller - Basit Fiiller" },
                        new { Id = 9084, Name = "Fiiller - Türemiş Fiiller" },
                        new { Id = 9085, Name = "Fiiller - Birleşik Fiiller" },
                        new { Id = 9086, Name = "Fiiller - Kurallı Birleşik Fiiller" },
                        new { Id = 9087, Name = "Fiiller - Yardımcı Eylemle Kurulan Birleşik Fiiller" },
                        new { Id = 9088, Name = "Fiiller - Anlamca Kaynaşmış Birleşik Fiiller" },
                        new { Id = 9089, Name = "Fiil Çekimi" },
                        new { Id = 9090, Name = "Fiil Çekimi - Haber Kipleri" },
                        new { Id = 9091, Name = "Fiil Çekimi - Dilek Kipleri" },
                        new { Id = 9092, Name = "Ek Fiil" },
                        new { Id = 9093, Name = "Cümlenin Ögeleri" },
                        new { Id = 9094, Name = "Cümle Türleri" },
                        new { Id = 9095, Name = "Sözel Mantık" },
                        new { Id = 9096, Name = "Görsel Okuma" },
                        new { Id = 9097, Name = "Söz Yorumu" },
                        new { Id = 9098, Name = "Deyimler ve Atasözleri" },

                        //turk dili ve edibiyati
                        new { Id = 10001, Name = "Anlam Bilgisi" },
                        new { Id = 10002, Name = "Dil Bilgisi" },
                        new { Id = 10003, Name = "Güzel Sanatlar ve Edebiyat" },
                        new { Id = 10004, Name = "Metinlerin Sınıflandırılması" },
                        new { Id = 10005, Name = "Şiir Bilgisi" },
                        new { Id = 10006, Name = "Edebi Sanatlar" },
                        new { Id = 10007, Name = "Türk Edebiyatı Dönemleri" },
                        new { Id = 10008, Name = "İslamiyet Öncesi Türk Edebiyatı ve Geçiş Dönemi" },
                        new { Id = 10009, Name = "Halk Edebiyatı" },
                        new { Id = 10010, Name = "Divan Edebiyatı" },
                        new { Id = 10011, Name = "Tanzimat Edebiyatı" },
                        new { Id = 10012, Name = "Servet-i Fünun Edebiyatı" },
                        new { Id = 10013, Name = "Fecr-i Ati Edebiyatı" },
                        new { Id = 10014, Name = "Milli Edebiyat" },
                        new { Id = 10015, Name = "Cumhuriyet Dönemi Edebiyatı" },
                        new { Id = 10016, Name = "Edebiyat Akımları" },
                        new { Id = 10017, Name = "Dünya Edebiyatı" },

                        //mantik
                        new { Id = 11001, Name = "Mantığa Giriş" },
                        new { Id = 11002, Name = "Mantığa Giriş" },
                        new { Id = 11003, Name = "Klasik Mantık" },
                        new { Id = 11004, Name = "Mantık ve Dil" },
                        new { Id = 11005, Name = "Sembolik Mantık" },

                        //Psikoloji
                        new { Id = 12001, Name = "Psikoloji Bilimini Tanıyalım" },
                        new { Id = 12002, Name = "Psikolojinin Temel Süreçleri" },
                        new { Id = 12003, Name = "Öğrenme Bellek Düşünme" },
                        new { Id = 12004, Name = "Ruh Sağlığının Temelleri" },

                        //Sosyoloji
                        new { Id = 13001, Name = "Sosyolojiye Giriş" },
                        new { Id = 13002, Name = "Birey ve Toplum" },
                        new { Id = 13003, Name = "Toplumsal Yapı" },
                        new { Id = 13004, Name = "Toplumsal Değişme ve Gelişme" },
                        new { Id = 13005, Name = "Toplum ve Kültür" },
                        new { Id = 13006, Name = "Toplumsal Kurumlar" },

                        //Inkılap
                        new { Id = 14001, Name = "Bir Kahraman Doğuyor" },
                        new { Id = 14002, Name = "Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar" },
                        new { Id = 14003, Name = "Milli Bir Destan: Ya İstiklal, Ya Ölüm" },
                        new { Id = 14004, Name = "Atatürkçülük ve Çağdaşlaşan Türkiye" },
                        new { Id = 14005, Name = "Demokratikleşme Çabaları" },
                        new { Id = 14006, Name = "Atatürk Dönemi Dış Politika" },
                        new { Id = 14007, Name = "Atatürk’ün Ölümü ve Sonrası" },

                        //ingilizce
                        new { Id = 15001, Name = "Friendship" },
                        new { Id = 15002, Name = "Teen Life" },
                        new { Id = 15003, Name = "In The Kitchen" },
                        new { Id = 15004, Name = "On The Phone" },
                        new { Id = 15005, Name = "The Internet" },
                        new { Id = 15006, Name = "Adventures" },
                        new { Id = 15007, Name = "Tourism" },
                        new { Id = 15008, Name = "Chores" },
                        new { Id = 15009, Name = "Science" },
                        new { Id = 15010, Name = "Natural Forces" },

                        //Fen bilimleri
                        new { Id = 16001, Name = "Mevsimler ve iklimler" },
                        new { Id = 16002, Name = "DNA ve Genetik Kod" },
                        new { Id = 16003, Name = "Basınç" },
                        new { Id = 16004, Name = "Madde ve EndüstriPeriyodik Sistem" },
                        new { Id = 16005, Name = "Fiziksel ve Kimyasal Değişimler" },
                        new { Id = 16006, Name = "Asitler ve Bazlar" },
                        new { Id = 16007, Name = "Madde ve Endüstri" },
                        new { Id = 16008, Name = "Basit Makineler" },
                        new { Id = 16009, Name = "Canlılar ve Enerji İlişkileri" },
                        new { Id = 16010, Name = "Enerji Dönüşümleri ve Çevre Bilimi" },
                        new { Id = 16011, Name = "Elektrik Yükleri ve Elektrik Enerjisi" },

                        //vatandalik
                        new { Id = 17001, Name = "Hukukun Temel Kavramları" },
                        new { Id = 17002, Name = "Hukukun Temel Kavramları - Hukukun Tanımı" },
                        new { Id = 17003, Name = "Hukukun Temel Kavramları - Hukuk Kaynaklarıyla İlgili Kavramlar" },
                        new { Id = 17004, Name = "Hukukun Temel Kavramları - Yazısız Kaynaklar (Örf Ve Adet Hukuku)" },
                        new { Id = 17005, Name = "Hukukun Temel Kavramları - Yardımcı Kaynaklar" },
                        new { Id = 17006, Name = "Hukukun Temel Kavramları - Hukuk Kurallarının Yaptırımları" },
                        new { Id = 17007, Name = "Hukukun Temel Kavramları - Kamu Hukuku Dalları" },
                        new { Id = 17008, Name = "Hukukun Temel Kavramları - Ceza Ve Ehliyet" },
                        new { Id = 17009, Name = "Hukukun Temel Kavramları - Özel Hukuk Dalları" },
                        new { Id = 17010, Name = "Hukukun Temel Kavramları - Hakkın Tanımı Ve Türleri" },
                        new { Id = 17011, Name = "Devlet Biçimleri Ve Hükümet Sistemleri" },
                        new { Id = 17012, Name = "Devlet Biçimleri Ve Hükümet Sistemleri - Devlet Kavramı" },
                        new { Id = 17013, Name = "Devlet Biçimleri Ve Hükümet Sistemleri - Devlet Kurucu Unsurları" },
                        new { Id = 17014, Name = "Devlet Biçimleri Ve Hükümet Sistemleri - Devlet Kavramına İlişkin Ayrımlar" },
                        new { Id = 17015, Name = "Devlet Biçimleri Ve Hükümet Sistemleri - Yapılarına Göre Devlet Şekilleri" },
                        new { Id = 17016, Name = "Devlet Biçimleri Ve Hükümet Sistemleri - Egemenliğin Kaynağına Göre Devlet Şekilleri" },
                        new { Id = 17017, Name = "Devlet Biçimleri Ve Hükümet Sistemleri - Hükümet Sistemleri" },
                        new { Id = 17018, Name = "Anayasa Hukukuna Giriş, Temel Kavramlar Ve Türk Anayasa Tarihi" },
                        new { Id = 17019, Name = "Anayasa Hukukuna Giriş - Anayasa" },
                        new { Id = 17020, Name = "Anayasa Hukukuna Giriş - Anayasa Kavramına İlişkin Ayrımlar" },
                        new { Id = 17021, Name = "Anayasa Hukukuna Giriş - Yazılı Anayasa - Yazısız Anayasa Ayrımı" },
                        new { Id = 17022, Name = "Anayasa Hukukuna Giriş - Türk Anayasa Tarih" },
                        new { Id = 17023, Name = "Anayasa Hukukuna Giriş - Kanun-U Esasî (1876)" },
                        new { Id = 17024, Name = "Anayasa Hukukuna Giriş - Kanun-U Esasî’de 1909 Değişiklikleri (İkinci Meşrutiyet)" },
                        new { Id = 17025, Name = "Anayasa Hukukuna Giriş - 1921 Teşkilât-I Esasiye Kanunu" },
                        new { Id = 17026, Name = "Anayasa Hukukuna Giriş - Teşkilat-I Esasiye Kanunu’nda 29 Ekim 1923 Tarihli Değişiklikler" },
                        new { Id = 17027, Name = "Anayasa Hukukuna Giriş - 1924 Anayasası" },
                        new { Id = 17028, Name = "Anayasa Hukukuna Giriş - 1961 Anayasası" },
                        new { Id = 17029, Name = "Anayasa Hukukuna Giriş - 1971-1973 Anayasa Değişiklikleri" },
                        new { Id = 17030, Name = "Anayasa Hukukuna Giriş - 1982 Anayasası" },
                        new { Id = 17031, Name = "Anayasa Hukukuna Giriş - 1982 Anayasasının Temel Özellikleri" },
                        new { Id = 17032, Name = "Anayasa Hukukuna Giriş - 2017 Anayasasının Temel Özellikleri" },
                        new { Id = 17033, Name = "Anayasa Hukukuna Giriş - Türk Tarihindeki Referandumlar" },
                        new { Id = 17034, Name = "Anayasa Hukukuna Giriş - 1982 Anayasası’nın Temel İlkeleri" },
                        new { Id = 17035, Name = "Yasama" },
                        new { Id = 17036, Name = "Yasama - Yasama Organı" },
                        new { Id = 17037, Name = "Yasama - Yasama İşlemleri" },
                        new { Id = 17038, Name = "Yasama - Tbmm İç Yapı Ve Çalışma Düzeni" },
                        new { Id = 17039, Name = "Yasama - Toplantı Ve Karar Yeter Sayısı" },
                        new { Id = 17040, Name = "Yasama - Tbmm Görev Ve Yetkileri" },
                        new { Id = 17041, Name = "Yasama - Tbmm Bilgi Edinme Ve Denetim Yolları" },
                        new { Id = 17042, Name = "Yürütme" },
                        new { Id = 17043, Name = "Yürütme - Kanun Hükmünde Kararnameler" },
                        new { Id = 17044, Name = "Yürütme - Cumhurbaşkanlığı Kararnamesi" },
                        new { Id = 17045, Name = "Yürütme - Yönetmelik" },
                        new { Id = 17046, Name = "Yürütme - Cumhurbaşkanı’nın Görev Ve Yetkileri" },
                        new { Id = 17047, Name = "Yargı" },
                        new { Id = 17048, Name = "Yargı - Yargı Organı" },
                        new { Id = 17049, Name = "Yargı - Hakimler Ve Savcılar Kurulu" },
                        new { Id = 17050, Name = "Yargı - Yüksek Mahkemeler" },
                        new { Id = 17051, Name = "Yargı - Anayasa Mahkemesi" },
                        new { Id = 17052, Name = "Yargı - Yargıtay" },
                        new { Id = 17053, Name = "Yargı - Danıştay" },
                        new { Id = 17054, Name = "Yargı - Uyuşmazlık Mahkemesi" },
                        new { Id = 17055, Name = "Yargı - Sayıştay" },
                        new { Id = 17056, Name = "Temel Hak Ve Hürriyetler" },
                        new { Id = 17057, Name = "Temel Hak Ve Hürriyetler - Temel Hakların Türleri" },
                        new { Id = 17058, Name = "İdare Hukuku" },
                        new { Id = 17059, Name = "İdare Hukuku - İdare (Kamu Yönetimi)" },
                        new { Id = 17060, Name = "İdare Hukuku - Yerel Yönetim Organları" },
                        new { Id = 17061, Name = "İdare Hukuku - Kamu Kuruluşları" },
                        new { Id = 17062, Name = "İdare Hukuku - Kamu Kuruluşları" },
                        //guncel bilgiler
                        new { Id = 18001, Name = "Uluslararası Kuruluşlar Ve Güncel Olaylar" },
                        new { Id = 18002, Name = "Uluslararası Örgüt Ve Kuruluşlar" },
                        new { Id = 18003, Name = "Kpss Güncel Bilgiler" },
                        new { Id = 18004, Name = "Türkiye’ye Vize Uygulamayan Ülkeler" },
                        new { Id = 18005, Name = "Unesco’nun Dünya Mirası Listesindeki Doğal Ve Kültürel Varlıklarımız" },

                        //Suneung-Suhak-수학
                        new { Id = 19001, Name = "이차곡선" }, //ikinci dereceden eğri
                        new { Id = 19002, Name = "포물선" }, //prabol
                        new { Id = 19003, Name = "타원" }, //elips
                        new { Id = 19004, Name = "쌍곡선" }, //hiperbol
                        new { Id = 19005, Name = "이차곡선과직선의위치관계" }, //İkinci dereceden eğri ile düz çizgi arasındaki konumsal ilişki
                        new { Id = 19006, Name = "평면벡터" }, //Düzlem Vektörü
                        new { Id = 19007, Name = "벡터의연산" }, //Vektör işlemleri
                        new { Id = 19008, Name = "벡터의뜻" }, //Vektörün anlamı
                        new { Id = 19009, Name = "벡터의덧셈과뺄셈" }, //Vektörlerin toplanması ve çıkarılması
                        new { Id = 19010, Name = "벡터의실수배" }, //Vektörün Skaler Çarpımı
                        new { Id = 19011, Name = "평면벡터의성분과내적" }, //Düzlem Vektörlerinin Bileşenleri ve İç Çarpımı
                        new { Id = 19012, Name = "위치벡터와평면벡터의성분" }, //Konum vektörü ve düzlem vektörünün bileşenleri
                        new { Id = 19013, Name = "평면벡터의내적" }, //Düzlem Vektörlerinin İç Çarpımı
                        new { Id = 19014, Name = "원의방정식" }, //Dairenin Denklemi
                        new { Id = 19015, Name = "공간도형과 공간좌표" }, //Uzaysal geometri ve uzaysal koordinatlar
                        new { Id = 19016, Name = "직선, 평면의위치관계" }, //Doğru ve Düzlemin Konum İlişkisi
                        new { Id = 19017, Name = "삼수선의정리" }, //Üç Doğrunun Kesişme Kuralı
                        new { Id = 19018, Name = "정사영" }, //Ortodogonal Yansıma
                        new { Id = 19019, Name = "공간좌표" }, //Uzay Koordinatları
                        new { Id = 19020, Name = "좌표공간에서의점의좌표" }, //Koordinat Uzayında Bir Noktanın Koordinatları
                        new { Id = 19021, Name = "두점사이의거리" }, //İki Nokta Arasındaki Mesafe
                        new { Id = 19022, Name = "선분의내분점과외분점" }, //Doğrunun İç Bölgesi ve Dış Bölgesi
                        new { Id = 19023, Name = "구의방정식" }, //Kürenin Denklemi
                        new { Id = 19024, Name = "경우의 수" }, //Durum sayisi
                        new { Id = 19025, Name = "순열" }, //permutasyon
                        new { Id = 19026, Name = "조합" }, //kombinasyon
                        new { Id = 19027, Name = "이항정리" }, //Binom
                        new { Id = 19028, Name = "확률" }, //olasilik
                        new { Id = 19029, Name = "조건부확률" }, //kosullu olasilik
                        new { Id = 19030, Name = "사건의 독립과 종속" }, //olaylarin bagimsizligi ve bagimliligi
                        new { Id = 19031, Name = "확률의 덧셈정리" }, //Olasılıkların Toplama Kuralı
                        new { Id = 19032, Name = "통계" }, //istatistik
                        new { Id = 19033, Name = "확률분포" }, //olasilik dagilimi
                        new { Id = 19034, Name = "확률변수와 확률분포" }, //rasgele degiskenler ve olasilik dagilimi
                        new { Id = 19035, Name = "이산확률변수의 기댓값과 표준편차" }, //Ayrık bir rastgele değişkenin beklenen değeri ve standart sapması
                        new { Id = 19036, Name = "이항분포" }, //binom dağılımı
                        new { Id = 19037, Name = "정규분포" }, //normal dağılım
                        new { Id = 19038, Name = "통계적 추정" }, //Istatistiksel Tahmin
                        new { Id = 19039, Name = "모집단과 표본" }, //Nüfus ve Örneklem
                        new { Id = 19040, Name = "모평균과 표본평균" }, //Nüfus ortalaması ve örnek ortalaması
                        new { Id = 19041, Name = "모평균의 추정" }, //Nüfus ortalamasının tahmini
                        new { Id = 19042, Name = "확률의 뜻" }, //olasılık anlamı
                        new { Id = 19043, Name = "수열의 극한" }, //bir dizinin limiti
                        new { Id = 19044, Name = "수열의 수렴과 발산" }, //Dizinin yakınsaması ve ıraksaması
                        new { Id = 19045, Name = "극한값의 계산" }, //Ekstrem değerlerin hesaplanması
                        new { Id = 19046, Name = "등비수열의 극한" }, //Geometrik Dizinin Limiti
                        new { Id = 19047, Name = "급수" }, //seri
                        new { Id = 19048, Name = "등비급수" }, //Geometrik seri
                        new { Id = 19049, Name = "지수함수와 로그함수의 극한" }, //Üstel ve logaritmik fonksiyonların limitleri
                        new { Id = 19050, Name = "삼각함수의 덧셈정리" }, //trigonometrik fonksiyonların toplam formülleri
                        new { Id = 19051, Name = "삼각함수의 극한" }, //Trigonometrik Fonksiyonların Limitleri
                        new { Id = 19052, Name = "수열" }, //dizi
                        new { Id = 19053, Name = "등차수열" }, //aritmetik dizi
                        new { Id = 19054, Name = "등비수열" }, //geometrik dizi
                        new { Id = 19055, Name = "수열의 합" }, //dizilerin toplami
                        new { Id = 19056, Name = "수학적 귀납법" }, //matematiksel tumevarim
                        new { Id = 19057, Name = "수열의 귀납적 정의" }, //Bir dizinin endüktif tanımı
                        new { Id = 19058, Name = "함수의 극한과 연속" }, //Fonksiyonun Limiti ve Sürekliliği
                        new { Id = 19059, Name = "함수의 극한" }, //bir fonksiyonun limiti
                        new { Id = 19060, Name = "함수의 극한에 대한 성질" }, //Fonksiyonun Limitiyle İlgili Özellikler
                        new { Id = 19061, Name = "함수의 연속" }, // Fonksiyonun Sürekliliği
                        new { Id = 19062, Name = "연속함수의 성질" }, //Sürekli fonksiyonların özellikleri
                        new { Id = 19063, Name = "미분" }, //Turev
                        new { Id = 19064, Name = "미분계수와 도함수" }, //Türev Katsayısı ve Türev Fonksiyonu
                        new { Id = 19065, Name = "미분가능성과 연속성" }, //Türevlenebilirlik ve süreklilik
                        new { Id = 19066, Name = "도함수의 활용" }, //Türev Fonksiyonunun Uygulamaları
                        new { Id = 19067, Name = "도함수의 활용 - 접선의 방정식" }, //Teğet Doğrunun Denklemi
                        new { Id = 19068, Name = "도함수의 활용 - 평균값 정리" }, //Ortalama deger teoremi
                        new { Id = 19069, Name = "도함수의 활용 - 함수의 증가와 감소, 극대와 극소" }, //Fonksiyonların arttırılması ve azaltılması, maksimum ve minimum
                        new { Id = 19070, Name = "도함수의 활용 - 함수의 그래프와 그 활용" }, //Fonksiyon grafikleri ve kullanımları
                        new { Id = 19071, Name = "도함수의 활용 - 속도와 가속도" }, //hiz ve ivme
                        new { Id = 19072, Name = "도함수의 - 방정식과 부등식에의 활용" }, //Denklemlerde ve eşitsizliklerde kullanım
                        new { Id = 19073, Name = "함수의 몫의 미분법" }, //Bir fonksiyonun bölümünün türevi
                        new { Id = 19074, Name = "합성함수의 미분법" }, //bileşke fonksiyonun türev kuralı
                        new { Id = 19075, Name = "음함수와 역함수의 미분법" }, //Örtülü ve ters fonksiyonların türevi
                        new { Id = 19076, Name = "매개변수로 나타낸 함수의 미분법" }, //Parametre olarak ifade edilen fonksiyonların türevi
                        new { Id = 19077, Name = "이계도함수" }, //ikinci dereceden turev
                        new { Id = 19078, Name = "사인함수와 코사인함수의 미분" }, //Sinüs ve kosinüs fonksiyonlarının türevleri
                        new { Id = 19079, Name = "지수함수와 로그함수의 미분" }, //Üstel ve logaritmik fonksiyonların türevleri
                        new { Id = 19080, Name = "적분" }, //Integral
                        new { Id = 19081, Name = "부정적분" }, //belirsiz integral
                        new { Id = 19082, Name = "부정적분의 계산" }, //Belirsiz İntegralin Hesaplanması
                        new { Id = 19083, Name = "적분법" }, //integresyon yontemleri
                        new { Id = 19084, Name = "적분법 - 치환적분법" }, //değişken değiştirme yöntemi
                        new { Id = 19085, Name = "적분법 - 부분적분법" }, //kısmi entegrasyon yöntemi
                        new { Id = 19086, Name = "정적분의 활용" }, //Belirli integrallerin uygulanmasi
                        new { Id = 19087, Name = "정적분의 활용 - 넓이" }, //alan
                        new { Id = 19088, Name = "정적분의 활용 - 부피" }, //hacim
                        new { Id = 19089, Name = "정적분의 활용 - 속도와 거리" }, //hız ve mesafe
                        new { Id = 19090, Name = "지수함수와 로그함수" }, //Üstel ve logaritmik fonksiyonlar
                        new { Id = 19091, Name = "거듭제곱과 거듭제곱근" }, //karekök, küpkök
                        new { Id = 19092, Name = "지수의 확장과 지수법칙" }, //üslerin genişletilmesi ve üs kuralları
                        new { Id = 19093, Name = "지수함수와 로그함수의 활용" }, //Üstel ve logaritmik fonksiyonların kullanımı
                        new { Id = 19094, Name = "지수함수의 뜻과 그래프" }, //Üstel fonksiyonun anlamı ve grafiği
                        new { Id = 19095, Name = "로그함수의 뜻과 그래프" }, //Logaritmik fonksiyonun anlamı ve grafiği
                        new { Id = 19096, Name = "삼각함수" }, //Trigonometri
                        new { Id = 19097, Name = "일반각과 호도법" }, //genel acilar ve aci yonetimi
                        new { Id = 19098, Name = "삼각함수의 그래프" }, //trigonometrik fonksiyonların grafiği
                        new { Id = 19099, Name = "사인법칙과 코사인법칙" }, //Sinüs Kanunu ve Kosinüs Kanunu
                        new { Id = 19100, Name = "다항식" }, //polinom
                        new { Id = 19101, Name = "다항식의 연산" }, //polinom uzerinde islemler.
                        new { Id = 19102, Name = "나머지정리" }, //polinomlarda kalanlar teoremi
                        new { Id = 19103, Name = "인수분해" }, //çarpanlara ayırma.
                        new { Id = 19104, Name = "방정식과 부등식" }, // denklemler ve esitsizlikler.
                        new { Id = 19105, Name = "복소수" }, //Karmaşık sayılar.
                        new { Id = 19106, Name = "이차방정식" }, //ikinci dereceden denklemler
                        new { Id = 19107, Name = "삼차방정식과 사차방정식" }, // Kübik ve dördüncü dereceden denklemler
                        new { Id = 19108, Name = "연립이차방정식" }, //Eşzamanlı ikinci dereceden denklemler
                        new { Id = 19109, Name = "절댓값을 포함한 일차부등식" }, //Mutlak değerleri içeren doğrusal eşitsizlikler
                        new { Id = 19110, Name = "이차부등식" }, //İkinci dereceden eşitsizlik
                        new { Id = 19111, Name = "도형의 방정식" }, //geometrik sekillerin denklemleri
                        new { Id = 19112, Name = "평면좌표" }, //düzlem koordinatları
                        new { Id = 19113, Name = "두 점 사이의 거리" }, //iki nokta arasındaki mesafe
                        new { Id = 19114, Name = "선분의 내분과 외분" }, //Bir çizgi bölümünün iç ve dış bölümü
                        new { Id = 19115, Name = "직선의 방정식" }, //düz bir çizginin denklemi
                        new { Id = 19116, Name = "두 직선의 평행과 수직" }, //İki düz çizgiye paralel ve dik
                        new { Id = 19117, Name = "점과 직선 사이의 거리" }, //nokta ve çizgi arasındaki mesafe
                        new { Id = 19118, Name = "도형의 이동" }, //şekillerin hareketi
                        new { Id = 19119, Name = "도형의 이동 - 평행이동" }, //paralel hareket
                        new { Id = 19120, Name = "도형의 이동 - 대칭이동" }, //simetrik hareket
                        new { Id = 19121, Name = "집합" }, //kümeler
                        new { Id = 19122, Name = "집합 사이의 포함 관계" }, //Kümeler arasındaki çevreleme ilişkiler
                        new { Id = 19123, Name = "집합의 연산" }, //kume islemleri
                        new { Id = 19124, Name = "명제" }, //onermeler
                        new { Id = 19125, Name = "명제와 조건" }, //önerme ve koşul
                        new { Id = 19126, Name = "명제 사이의 관계" }, //önermeler arasındaki ilişkiler
                        new { Id = 19127, Name = "명제의 증명" }, //önermenin kanıtı
                        new { Id = 19128, Name = "함수와 그래프" }, //Fonksiyonlar ve Grafikler
                        new { Id = 19129, Name = "합성함수" }, //bileşik fonksiyon
                        new { Id = 19130, Name = "역함수" }, //ters fonksiyon
                        new { Id = 19131, Name = "유리함수와 무리함수" }, //Rasyonel ve irrasyonel fonksiyonlar
                        new { Id = 19132, Name = "유리함수와 그 그래프" }, //Rasyonel fonksiyonlar ve grafikleri
                        new { Id = 19133, Name = "무리함수와 그 그래프" }, //İrrasyonel fonksiyonlar ve grafikleri

                        //Suneung Gug-eo 국어
                        new { Id = 20001, Name = "문법" }, //dil biligisi
                        new { Id = 20002, Name = "단어의 종류 (명사, 동사, 형용사 등)" }, //Kelime türleri (isim, fiil, sıfat vb.)
                        new { Id = 20003, Name = "문장 구조와 문장 유형" }, //Cümle yapısı ve cümle türleri
                        new { Id = 20004, Name = "동사 활용과 시제" }, //Fiil çekimleri ve zamanlar
                        new { Id = 20005, Name = "조사와 접속사" }, //Ekler ve bağlaçlar
                        new { Id = 20006, Name = "어휘 구조와 의미 관계" }, //Sözcük yapısı ve anlam ilişkileri
                        new { Id = 20007, Name = "읽기" }, //Okuma Anlama
                        new { Id = 20008, Name = "정보성 글 (기사, 에세이, 설명문)" }, //Bilgilendirici metinler (makaleler, denemeler, açıklayıcı metinler)
                        new { Id = 20009, Name = "서사형 글 (이야기, 소설 발췌문)" }, //Anlatı türündeki metinler (öyküler, romanlardan kesitler)
                        new { Id = 20010, Name = "시와 서정적 글" }, //Şiir ve lirik metinler
                        new { Id = 20011, Name = "중심 생각, 부가 생각, 중심 생각을 지지하는 세부 사항 찾기" }, //Ana fikir, yan fikir, ana düşünceyi destekleyen detayları bulma
                        new { Id = 20012, Name = "작가의 목적과 글의 맥락" }, //Yazarın amacı ve metnin bağlamı
                        new { Id = 20013, Name = "쓰기" }, //Yazma
                        new { Id = 20014, Name = "생각 개발 및 구성" }, //Fikir geliştirme ve organizasyon
                        new { Id = 20015, Name = "다양한 글 유형 (기사, 에세이, 설명문, 이야기)" }, //Farklı yazı türleri (makale, deneme, açıklama, anlatı)
                        new { Id = 20016, Name = "명확하고 효과적인 문장 구조)" }, //Net ve etkili cümle yapıları
                        new { Id = 20017, Name = "논리적 사고와 주장 개발" }, //Mantıksal düşünme ve argüman geliştirme
                        new { Id = 20018, Name = "주제에 맞는 언어 사용" }, //Konuya uygun dil kullanımı
                        new { Id = 20019, Name = "문학" }, //Edebiyat
                        new { Id = 20020, Name = "한국 문학의 주요 유형 (시, 단편 소설, 소설, 연극)" }, //Kore edebiyatının ana türleri (şiir, kısa hikaye, roman, tiyatro)
                        new { Id = 20021, Name = "고전 문학 (고전 문학): 조선 시대의 시와 민담" }, //Klasik Kore edebiyatı (고전 문학 / Gojon Munhak): Joseon dönemi şiirleri, halk masalları
                        new { Id = 20022, Name = "현대 문학: 20세기 이후의 한국 시, 소설, 연극" }, //Modern Kore edebiyatı: 20. yüzyıl sonrası Kore şiiri, romanları ve oyunlar
                        new { Id = 20023, Name = "문학적 기법과 표현 방식" }, //Edebi teknikler ve anlatım biçimleri
                        new { Id = 20024, Name = "문학 작품에서의 주제, 모티프 및 인물 분석" }, //Edebi eserlerde tema, motif ve karakter analizi
                        new { Id = 20025, Name = "화법" }, //Konuşma ve Dinleme
                        new { Id = 20026, Name = "효과적인 화법 기술과 연설" }, //Etkili konuşma teknikleri ve hitabet
                        new { Id = 20027, Name = "듣기 및 이해 능력" }, //Dinleme ve anlama becerileri
                        new { Id = 20028, Name = "대중 앞에서의 연설" }, //Topluluk önünde konuşma
                        new { Id = 20029, Name = "설득력 있는 연설과 토론" }, //İkna edici konuşmalar ve tartışmalar
                        new { Id = 20030, Name = "올바른 발음과 강세 사용" }, //Doğru telaffuz ve vurgu kullanımı
                        new { Id = 20031, Name = "한자" }, //Hanja / Çin Karakterleri
                        new { Id = 20032, Name = "한자 문자와 그 의미" }, //Hanja karakterleri ve anlamları
                        new { Id = 20033, Name = "한국어에서 사용되는 일반적인 한자 어휘와 그 기원" }, //Korecede kullanılan yaygın Hanja sözcükleri ve kökenleri
                        new { Id = 20034, Name = "어휘력을 향상시키기 위한 한자 활용" }, //Kelime bilgisi geliştirme için Hanja kullanımı
                        new { Id = 20035, Name = "한자가 한국어에 미친 영향" }, //Hanja'nın Kore dili üzerindeki etkisi

                        //Suneung English 영어
                        new { Id = 30001, Name = "독해" },//Okuma Anlama
                        new { Id = 30002, Name = "문법" },// Dil Bilgisi
                        new { Id = 30003, Name = "어휘 및 표현" },//Kelimeler ve İfade Bilgisi
                        new { Id = 30004, Name = "듣기" },//Dinleme
                        new { Id = 30005, Name = "완성형 문제" },//Tamamlama Soruları
                        new { Id = 30006, Name = "비판적 사고" },//Eleştirel Düşünme

                        //Suneung Hangugsa 한국사
                        new { Id = 40001, Name = "고대 국가의 형성과 발전" },//Antik Krallıkların Kuruluşu ve Gelişimi
                        new { Id = 40002, Name = "고조선: 한국의 가장 오래된 고대 국가." },//고조선 (Gojoseon): Kore’nin bilinen en eski krallığı.
                        new { Id = 40003, Name = "부여, 옥저, 동예, 삼한: 한반도의 고대 부족과 국가들." },//부여, 옥저, 동예, 삼한 (Buyeo, Okjeo, Dongye, Samhan): Kore Yarımadası'nda antik kabileler ve devletler.
                        new { Id = 40004, Name = "삼국 시대: 고구려, 백제, 신라의 성장." },//삼국 시대 (Üç Krallık Dönemi): Goguryeo, Baekje ve Silla krallıklarının yükselişi.
                        new { Id = 40005, Name = "가야: 삼국 시대의 소국 연맹." },//가야 (Gaya Konfederasyonu): Üç Krallık dönemindeki küçük devlet konfederasyonu.
                        new { Id = 40006, Name = "통일신라와 발해" },//Birleşik Silla ve Balhae Dönemi
                        new { Id = 40007, Name = "신라가 다른 국가들을 통일하여 한반도를 통합한 과정." },//Silla’nın diğer krallıkları fethederek Kore Yarımadası’nı birleştirmesi.
                        new { Id = 40008, Name = "발해: 고구려 멸망 후 북쪽에 세워진 국가." },//발해 (Balhae): Goguryeo’nun yıkılmasından sonra kuzeyde kurulan devlet.
                        new { Id = 40009, Name = "통일신라 시대의 문화, 예술, 불교 발전." },//Birleşik Silla döneminde kültür, sanat ve Budizmin gelişimi.
                        new { Id = 40010, Name = "고려 시대" },//Goryeo Dönemi
                        new { Id = 40011, Name = "고려의 설립과 통치 체제." },//Goryeo Krallığı’nın kuruluşu ve yönetim sistemi.
                        new { Id = 40012, Name = "몽골 침입과 고려의 몽골 제국에 대한 종속 과정." },//Moğol istilaları ve Goryeo'nun Moğol İmparatorluğu’na bağlılık süreci.
                        new { Id = 40013, Name = "팔만대장경과 같은 중요한 문화재의 제작." },//팔만 대장경 (Tripitaka Koreana) gibi önemli kültürel eserlerin geliştirilmesi.
                        new { Id = 40014, Name = "불교가 국교로 강력히 자리 잡음." },//Budizm’in devlet destekli din olarak güçlenmesi.
                        new { Id = 40015, Name = "조선 시대" },//Joseon Dönemi
                        new { Id = 40016, Name = "조선의 설립과 유교 체제 도입." },//Joseon Krallığı’nın kuruluşu ve Konfüçyüsçü sistemin benimsenmesi.
                        new { Id = 40017, Name = "세종대왕과 한글 창제." },//세종대왕 (Kral Sejong) ve Hangıl alfabesinin icadı.
                        new { Id = 40018, Name = "일본의 침략: 임진왜란 (1592년 일본 침입)." },//Japon saldırıları: 임진왜란 (Imjin Savaşı - Japonya'nın 1592’deki istilası).
                        new { Id = 40019, Name = "병자호란과 조선의 청나라에 대한 종속 과정." },//병자호란 (Byeongja Horan - Mançu istilası) ve Joseon'un Qing Hanedanlığı'na bağlılık süreci.
                        new { Id = 40020, Name = "조선 시대의 사회적 계층, 유교 교육, 과학." },//Joseon dönemindeki toplumsal sınıflar, Konfüçyüsçü eğitim ve bilim.
                        new { Id = 40021, Name = "개화기와 대한제국" },//Açılma Dönemi ve Kore İmparatorluğu
                        new { Id = 40022, Name = "조선의 개방 과정." },//Joseon’un dış dünyaya açılma süreci.
                        new { Id = 40023, Name = "갑신정변과 근대화 노력." },//갑신정변 (Gapsin Darbesi) ve modernleşme çabaları.
                        new { Id = 40024, Name = "대한제국의 선포와 독립 노력." },//Kore İmparatorluğu'nun (대한제국) ilanı ve bağımsızlık çabaları.
                        new { Id = 40025, Name = "일본의 영향력 증대." },//Japonya'nın Kore üzerindeki etkisinin artması.
                        new { Id = 40026, Name = "일제강점기" },//Japon Sömürge Dönemi
                        new { Id = 40027, Name = "**한일병합조약 (1910년)**으로 시작된 식민 지배." },//한일병합조약 (1910 Kore-Japonya İlhak Anlaşması) ile başlayan sömürge dönemi.
                        new { Id = 40028, Name = "한국인의 독립 운동과 3.1 운동과 같은 저항 운동." },//Kore halkının bağımsızlık hareketleri ve 3.1 운동 (1 Mart Hareketi) gibi direnişler.
                        new { Id = 40029, Name = "일제의 경제적, 문화적 억압." },//Japon yönetimi altında ekonomik ve kültürel baskılar.
                        new { Id = 40030, Name = "독립 운동의 발전과 디아스포라." },//Kore’de bağımsızlık hareketlerinin gelişmesi ve diaspora.
                        new { Id = 40031, Name = "광복과 대한민국의 수립" },//Kurtuluş ve Güney Kore’nin Kuruluşu
                        new { Id = 40032, Name = "제2차 세계 대전 후 일본 패배로 인한 한국의 광복." },//II. Dünya Savaşı sonrasında Japonya’nın yenilgisiyle Kore’nin kurtuluşu.
                        new { Id = 40033, Name = "한반도가 38선으로 분단됨." },//Kore Yarımadası’nın 38. paralelden ikiye bölünmesi.
                        new { Id = 40034, Name = "1948년 대한민국과 조선민주주의인민공화국 수립." },//1948’de Güney Kore’nin (대한민국) ve Kuzey Kore’nin (조선민주주의인민공화국) kurulması.
                        new { Id = 40035, Name = "한국전쟁 (1950-1953)과 분단 고착화." },//Kore Savaşı (1950-1953) ve bölünmenin pekişmesi.
                        new { Id = 40036, Name = "현대사" },//Modern Kore Tarihi
                        new { Id = 40037, Name = "대한민국의 경제 발전과 산업화 과정." },//Güney Kore’de ekonomik kalkınma ve sanayileşme dönemi.
                        new { Id = 40038, Name = "군사 쿠데타와 민주화 운동: 4.19 혁명, 5.18 광주 민주화 운동." },//Askeri darbeler ve demokrasi hareketleri: 4.19 혁명 (19 Nisan Devrimi), 5.18 광주 민주화 운동 (Gwangju Demokrasi Hareketi).
                        new { Id = 40039, Name = "대한민국의 민주화 과정." },//Güney Kore’nin demokratikleşme süreci.
                        new { Id = 40040, Name = "남북한 관계, 핵 문제, 한국의 국제 관계." },//Kuzey-Güney Kore ilişkileri, nükleer silah sorunu ve Kore’nin uluslararası ilişkileri.

                        //Suneung Life & Ethics 삶과 윤리
                        new { Id = 50001, Name = "윤리 이론 및 기본 개념" },//Etik Teoriler ve Temel Kavramlar
                        new { Id = 50002, Name = "공리주의" },//Faydacılık
                        new { Id = 50003, Name = "의무론" },//Deontoloji
                        new { Id = 50004, Name = "덕 윤리" },//Erdem Etiği
                        new { Id = 50005, Name = "권리와 정의" },//Haklar ve Adalet
                        new { Id = 50006, Name = "개인 윤리와 인격 개발" },//Kişisel Ahlak ve Karakter Gelişimi
                        new { Id = 50007, Name = "책임과 의무" },//Sorumluluk ve Görev
                        new { Id = 50008, Name = "정직과 공정성" },//Dürüstlük ve Adalet
                        new { Id = 50009, Name = "자기 훈련과 인내" },//Özdisiplin ve Sabı
                        new { Id = 50010, Name = "도덕적 딜레마" },//Ahlaki İkilemler
                        new { Id = 50011, Name = "사회적 윤리" },//Toplumsal Etik
                        new { Id = 50012, Name = "가족과 공동체 관계" },//Aile ve Topluluk İlişkileri
                        new { Id = 50013, Name = "환경 윤리" },//Çevresel Etik
                        new { Id = 50014, Name = "사회 정의와 인권" },//Sosyal Adalet ve İnsan Hakları
                        new { Id = 50015, Name = "소셜 미디어와 디지털 윤리" },//Sosyal Medya ve Dijital Etik
                        new { Id = 50016, Name = "세계적 윤리 문제" },//Küresel Etik Sorunlar
                        new { Id = 50017, Name = "평화와 전쟁 윤리" },//Barış ve Savaş Etiği
                        new { Id = 50018, Name = "이주자와 난민" },//Göçmenler ve Mülteciler
                        new { Id = 50019, Name = "세계적 빈곤과 불평등" },//Küresel Yoksulluk ve Eşitsizlik
                        new { Id = 50020, Name = "기후 변화와 미래 세대" },//İklim Değişikliği ve Gelecek Nesiller
                        new { Id = 50021, Name = "과학과 기술 윤리" },//Bilim ve Teknoloji Etiği
                        new { Id = 50022, Name = "생명공학 및 유전 공학" },//Biyoteknoloji ve Genetik Mühendislik
                        new { Id = 50023, Name = "인공지능과 자동화" },//Yapay Zeka ve Otomasyon
                        new { Id = 50024, Name = "의료 윤리" },//Tıp Etiği
                        new { Id = 50025, Name = "정보 기술 윤리" },//Bilgi Teknolojisi Etiği
                        new { Id = 50026, Name = "인간 관계에서의 윤리" },//İnsan İlişkilerinde Etik
                        new { Id = 50027, Name = "우정과 사랑" },//Arkadaşlık ve Sevgi
                        new { Id = 50028, Name = "갈등 해결" },//Çatışma Çözümü
                        new { Id = 50029, Name = "공감과 관용" },//Empati ve Hoşgörü
                        new { Id = 50030, Name = "용서와 이해" },//Bağışlayıcılık ve Anlayış

                        //Suneung  Ethics & Thoughts 윤리와 사상
                        new { Id = 60001, Name = "고대와 현대 윤리 이론" },//Antik ve Modern Etik Teorileri
                        new { Id = 60002, Name = "고대 그리스 철학" },//Antik Yunan Felsefesi
                        new { Id = 60003, Name = "근대 윤리 사상" },//Modern Etik Düşünceler
                        new { Id = 60004, Name = "현대 윤리 이론" },//Çağdaş Etik Teorileri
                        new { Id = 60005, Name = "동양의 윤리 사상" },//Doğu Etiği
                        new { Id = 60006, Name = "동양 철학의 주요 사상" },//Doğu Felsefesinin Temel Düşünceleri
                        new { Id = 60007, Name = "유교 사상" },//Konfüçyüsçülük
                        new { Id = 60008, Name = "불교 사상" },//Budist Düşünceler
                        new { Id = 60009, Name = "도교 사상" },//Taoizm
                        new { Id = 60010, Name = "한국 전통 사상" },//Kore Geleneksel Düşüncesi
                        new { Id = 60011, Name = "서양 철학의 주요 사상" },//Batı Felsefesinin Temel Düşünceleri
                        new { Id = 60012, Name = "실재론과 형이상학" },//Gerçekçilik ve Metafizik
                        new { Id = 60013, Name = "인식론" },//Bilgi Felsefesi
                        new { Id = 60014, Name = "정치 철학" },//Siyaset Felsefesi
                        new { Id = 60015, Name = "실존주의" },//Varoluşçuluk
                        new { Id = 60016, Name = "윤리적 딜레마와 현대적 윤리 문제" },//Etik İkilemler ve Güncel Etik Sorunlar
                        new { Id = 60017, Name = "생명 윤리" },//Yaşam Etiği
                        new { Id = 60018, Name = "환경 윤리" },//Çevre Etiği
                        new { Id = 60019, Name = "디지털 윤리" },//Dijital Etik
                        new { Id = 60020, Name = "사회 정의와 평등" },//Toplumsal Adalet ve Eşitlik
                        new { Id = 60021, Name = "자아와 도덕적 성장" },//Benlik ve Ahlaki Gelişim
                        new { Id = 60022, Name = "도덕적 자아의 형성" },//Ahlaki Benliğin Gelişimi
                        new { Id = 60023, Name = "도덕적 판단과 가치관" },//Ahlaki Yargı ve Değerler
                        new { Id = 60024, Name = "인간의 행복과 삶의 의미" },//İnsan Mutluluğu ve Yaşamın Anlamı
                        new { Id = 60025, Name = "사회와 윤리" },//Toplum ve Etik
                        new { Id = 60026, Name = "사회 계약과 도덕적 책임" },//Toplum Sözleşmesi ve Ahlaki Sorumluluk
                        new { Id = 60027, Name = "공동체 윤리" },//Topluluk Etiği
                        new { Id = 60028, Name = "정의와 평화" },//Adalet ve Barış
                        new { Id = 60029, Name = "사회적 공정성과 복지" },//Toplumsal Eşitlik ve Refah
                        new { Id = 60030, Name = "과학과 기술의 윤리적 측면" },//Bilim ve Teknolojinin Etik Boyutları
                        new { Id = 60031, Name = "생명공학과 유전공학" },//Biyoteknoloji ve Genetik Mühendisliği
                        new { Id = 60032, Name = "인공지능과 로봇 윤리" },//Yapay Zeka ve Robot Etiği
                        new { Id = 60033, Name = "의료 윤리" },//Tıp Etiği
                        new { Id = 60034, Name = "세계 윤리와 인류애" },//Küresel Etik ve İnsanlık Sevgisi
                        new { Id = 60035, Name = "세계적 연대와 상호 의존" },//Küresel Dayanışma ve Karşılıklı Bağımlılık
                        new { Id = 60036, Name = "인권과 정의" },//İnsan Hakları ve Adalet
                        new { Id = 60037, Name = "평화와 갈등 해결" },//Barış ve Çatışma Çözümü
                        new { Id = 60038, Name = "빈곤과 불평등" },//Yoksulluk ve Eşitsizlik

                        //Suneung Korean Geography 한국 지리
                        new { Id = 70001, Name = "대한민국의 지형" },//Güney Kore'nin Fiziki Coğrafyası
                        new { Id = 70002, Name = "산과 계곡" },//Dağlar ve Vadiler
                        new { Id = 70003, Name = "강과 호수" },//Nehirler ve Göller
                        new { Id = 70004, Name = "해안선과 섬" },//Kıyı Şeridi ve Adalar
                        new { Id = 70005, Name = "토양 구조" },//Toprak Yapısı
                        new { Id = 70006, Name = "기후와 날씨" },//İklim ve Hava Durumu
                        new { Id = 70007, Name = "계절적 기후 특성" },//Mevsimlik İklim Özellikleri
                        new { Id = 70008, Name = "몬순 영향" },//Muson Etkisi
                        new { Id = 70009, Name = "자연재해" },//Doğal Afetler
                        new { Id = 70010, Name = "기후 변화" },//Küresel İklim Değişikliği
                        new { Id = 70011, Name = "인구와 인구 통계" },//Nüfus ve Demografi
                        new { Id = 70012, Name = "인구 분포" },//Nüfus Dağılımı
                        new { Id = 70013, Name = "이동과 이주" },//Göç ve Yer Değiştirme
                        new { Id = 70014, Name = "고령화와 출산율" },//Yaşlanma ve Doğurganlık Oranları
                        new { Id = 70015, Name = "인구 정책" },//Nüfus Politikaları
                        new { Id = 70016, Name = "경제 지리와 자원" },//Ekonomik Coğrafya ve Doğal Kaynaklar
                        new { Id = 70017, Name = "자원" },//Doğal Kaynaklar
                        new { Id = 70018, Name = "농업 및 산업 지역" },//Tarım ve Endüstri Bölgeleri
                        new { Id = 70019, Name = "에너지 자원" },//Enerji Kaynakları
                        new { Id = 70020, Name = "국제 무역과 수출" },//Küresel Ticaret ve İhracat
                        new { Id = 70021, Name = "지역 지리" },//Bölgesel Coğrafya
                        new { Id = 70022, Name = "지역 특성" },//Bölgesel Özellikler
                        new { Id = 70023, Name = "대도시 및 대도시권" },//Büyük Şehirler ve Metropoller
                        new { Id = 70024, Name = "관광지" },//Turistik Bölgeler
                        new { Id = 70025, Name = "환경과 자연 보호" },//Çevre ve Doğal Koruma
                        new { Id = 70026, Name = "환경 문제" },//Çevresel Sorunlar
                        new { Id = 70027, Name = "자연 보호 구역" },//Doğal Koruma Alanları
                        new { Id = 70028, Name = "폐기물 관리 및 재활용" },//Atık Yönetimi ve Geri Dönüşüm
                        new { Id = 70029, Name = "지속 가능한 개발" },//Sürdürülebilir Kalkınma
                        new { Id = 70030, Name = "교통 및 인프라" },//Ulaşım ve Altyapı
                        new { Id = 70031, Name = "도로와 철도망" },//Karayolu ve Demiryolu Ağı
                        new { Id = 70032, Name = "항만과 공항" },//Limanlar ve Havaalanları
                        new { Id = 70033, Name = "도시 내 교통" },//Şehir İçi Ulaşım
                        new { Id = 70034, Name = "교통의 기술적 발전" },//Ulaşımda Teknolojik Gelişmeler
                        new { Id = 70035, Name = "한반도의 지리적 및 정치적 중요성" },//Kore Yarımadası'nın Coğrafi ve Siyasi Önemi
                        new { Id = 70036, Name = "지리적 위치와 전략적 중요성" },//Coğrafi Konum ve Stratejik Önemi
                        new { Id = 70037, Name = "북한과의 관계" },//Kuzey Kore ile İlişkiler
                        new { Id = 70038, Name = "군사 지역과 보안 정책" },//Askeri Alanlar ve Güvenlik Politikaları

                    ]
                );
        }
    }
}
