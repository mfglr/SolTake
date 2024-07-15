using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.TopicAggregate;

namespace MySocailApp.Infrastructure.Seeds
{
    public class Tyt_Turkce_TopicSeed : IEntityTypeConfiguration<Topic>
    {
        public void Configure(EntityTypeBuilder<Topic> builder)
        {
            builder.HasData(
                new { Id = 1, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Sözcükte Anlam" },
                new { Id = 2, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Söz Yorumu" },
                new { Id = 3, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Deyim ve Atasözü" },
                new { Id = 4, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Cümlede Anlam" },
                new { Id = 5, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Paragraf" },
                new { Id = 6, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Paragrafta Anlatım Teknikleri" },
                new { Id = 7, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Paragrafta Düşünceyi Geliştirme Yolları" },
                new { Id = 8, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Paragrafta Yapı" },
                new { Id = 9, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Paragrafta Konu-Ana Düşünce" },
                new { Id = 10, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Paragrafta Yardımcı Düşünce" },
                new { Id = 11, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Ses Bilgisi" },
                new { Id = 12, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Yazım Kuralları" },
                new { Id = 13, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Noktalama İşaretleri" },
                new { Id = 14, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Sözcükte Yapı/Ekler" },
                new { Id = 15, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Sözcük Türleri" },
                new { Id = 16, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "İsimler" },
                new { Id = 17, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Zamirler" },
                new { Id = 18, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Sıfatlar" },
                new { Id = 19, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Zarflar" },
                new { Id = 20, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Edat" },
                new { Id = 21, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Bağlaç" },
                new { Id = 22, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Ünlem" },
                new { Id = 23, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Edat - Bağlaç - Ünlem" },
                new { Id = 24, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Fiiller" },
                new { Id = 25, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Fiilde Anlam (Kip-Kişi-Yapı)" },
                new { Id = 26, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Ek Fiil" },
                new { Id = 27, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Fiilimsi" },
                new { Id = 28, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Fiilde Çatı" },
                new { Id = 29, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Sözcük Grupları" },
                new { Id = 30, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Cümlenin Ögeleri" },
                new { Id = 31, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Cümle Türleri" },
                new { Id = 32, CreatedAt = DateTime.UtcNow, SubjectId = 1, Name = "Anlatım Bozukluğu" }
            );
        }
    }
}
