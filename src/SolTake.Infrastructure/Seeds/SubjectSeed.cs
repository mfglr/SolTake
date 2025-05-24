using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds
{
    public class SubjectSeed : IEntityTypeConfiguration<Subject>
    {
        public void Configure(EntityTypeBuilder<Subject> builder)
        {
            builder.HasData(
                new { Id = 1, ExamId = 1, Name = "TYT - Türkçe" },
                new { Id = 2, ExamId = 1, Name = "TYT - Tarih" },
                new { Id = 3, ExamId = 1, Name = "TYT - Coğrafya" },
                new { Id = 4, ExamId = 1, Name = "TYT - Felsefe" },
                new { Id = 5, ExamId = 1, Name = "TYT - Din Kültürü ve Ahlâk Bilgisi" },
                new { Id = 6, ExamId = 1, Name = "TYT - Matematik" },
                new { Id = 7, ExamId = 1, Name = "TYT - Geometri" },
                new { Id = 8, ExamId = 1, Name = "TYT - Fizik" },
                new { Id = 9, ExamId = 1, Name = "TYT - Kimya" },
                new { Id = 10, ExamId = 1, Name = "TYT - Biyoloji" },

                new { Id = 101, ExamId = 2, Name = "AYT - Matematik" },
                new { Id = 102, ExamId = 2, Name = "AYT - Geometri" },
                new { Id = 103, ExamId = 2, Name = "AYT - Fizik" },
                new { Id = 104, ExamId = 2, Name = "AYT - Kimya" },
                new { Id = 105, ExamId = 2, Name = "AYT - Biyoloji " },
                new { Id = 106, ExamId = 2, Name = "AYT - Coğrafya " },
                new { Id = 107, ExamId = 2, Name = "AYT - Tarih " },
                new { Id = 108, ExamId = 2, Name = "AYT - Türk Dili ve Edebiyatı" },
                new { Id = 109, ExamId = 2, Name = "AYT - Din Kültürü ve Ahlâk Bilgisi" },
                new { Id = 110, ExamId = 2, Name = "AYT - Felsefe" },
                new { Id = 111, ExamId = 2, Name = "AYT - Psikoloji" },
                new { Id = 112, ExamId = 2, Name = "AYT - Sosyoloji" },
                new { Id = 113, ExamId = 2, Name = "AYT - Mantık" },

                new { Id = 201, ExamId = 3, Name = "Lgs - Türkçe" },
                new { Id = 202, ExamId = 3, Name = "Lgs - İnkılâp Tarihi ve Atatürkçülük" },
                new { Id = 203, ExamId = 3, Name = "Lgs - Din Kültürü ve Ahlâk Bilgisi" },
                new { Id = 204, ExamId = 3, Name = "Lgs - İngilizce" },
                new { Id = 205, ExamId = 3, Name = "Lgs - Fen Bilimleri" },
                new { Id = 206, ExamId = 3, Name = "Lgs - Matematik" },

                new { Id = 301, ExamId = 4, Name = "KPSS - Türkçe" },
                new { Id = 302, ExamId = 4, Name = "KPSS - Matematik" },
                new { Id = 303, ExamId = 4, Name = "KPSS - Geometri" },
                new { Id = 304, ExamId = 4, Name = "KPSS - Tarih" },
                new { Id = 305, ExamId = 4, Name = "KPSS - Coğrafya" },
                new { Id = 306, ExamId = 4, Name = "KPSS - Vatandaşlık" },
                new { Id = 307, ExamId = 4, Name = "KPSS - Güncel Bilgiler" },

                new { Id = 401, ExamId = 5, Name = "DGS - Matematik" },
                new { Id = 402, ExamId = 5, Name = "DGS - Türkçe" },
                new { Id = 403, ExamId = 5, Name = "DGS - Geometri" }
            );
        }
    }
}
