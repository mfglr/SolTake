using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate;

namespace MySocailApp.Infrastructure.Seeds
{
    public class SubjectSeed : IEntityTypeConfiguration<Subject>
    {
        public void Configure(EntityTypeBuilder<Subject> builder)
        {
            builder.HasData(
                new { Id = 1, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Türkçe" },
                new { Id = 2, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Tarih" },
                new { Id = 3, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Coğrafya" },
                new { Id = 4, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Felsefe" },
                new { Id = 5, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Din Kültürü ve Ahlâk Bilgisi" },
                new { Id = 6, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Matematik" },
                new { Id = 7, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Geometri" },
                new { Id = 8, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Fizik" },
                new { Id = 9, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Kimya" },
                new { Id = 10, CreatedAt = DateTime.UtcNow, ExamId = 1, Name = "TYT - Biyoloji" },

                new { Id = 11, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Matematik" },
                new { Id = 12, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Geometri" },
                new { Id = 13, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Fizik" },
                new { Id = 14, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Kimya" },
                new { Id = 15, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Biyoloji " },
                new { Id = 16, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Coğrafya " },
                new { Id = 17, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Tarih " },
                new { Id = 18, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Türk Dili ve Edebiyatı" },
                new { Id = 19, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Din Kültürü ve Ahlâk Bilgisi" },
                new { Id = 20, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Felsefe" },
                new { Id = 21, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Psikoloji" },
                new { Id = 22, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Sosyoloji" },
                new { Id = 23, CreatedAt = DateTime.UtcNow, ExamId = 2, Name = "AYT - Mantık" }
            );
        }
    }
}
