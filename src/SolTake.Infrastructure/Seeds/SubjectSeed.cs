﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds
{
    public class SubjectSeed : IEntityTypeConfiguration<Subject>
    {
        public void Configure(EntityTypeBuilder<Subject> builder)
        {
            builder.HasData(
                new { Id = 1, ExamId = 1, Name = "TYT - Türkçe", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 2, ExamId = 1, Name = "TYT - Tarih", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 3, ExamId = 1, Name = "TYT - Coğrafya", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 4, ExamId = 1, Name = "TYT - Felsefe", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 5, ExamId = 1, Name = "TYT - Din Kültürü ve Ahlâk Bilgisi", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 6, ExamId = 1, Name = "TYT - Matematik", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 7, ExamId = 1, Name = "TYT - Geometri", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 8, ExamId = 1, Name = "TYT - Fizik", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 9, ExamId = 1, Name = "TYT - Kimya", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 10, ExamId = 1, Name = "TYT - Biyoloji", CreatedAt = new DateTime(2025, 6, 9) },

                new { Id = 101, ExamId = 2, Name = "AYT - Matematik", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 102, ExamId = 2, Name = "AYT - Geometri", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 103, ExamId = 2, Name = "AYT - Fizik", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 104, ExamId = 2, Name = "AYT - Kimya", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 105, ExamId = 2, Name = "AYT - Biyoloji ", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 106, ExamId = 2, Name = "AYT - Coğrafya ", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 107, ExamId = 2, Name = "AYT - Tarih ", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 108, ExamId = 2, Name = "AYT - Türk Dili ve Edebiyatı", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 109, ExamId = 2, Name = "AYT - Din Kültürü ve Ahlâk Bilgisi", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 110, ExamId = 2, Name = "AYT - Felsefe", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 111, ExamId = 2, Name = "AYT - Psikoloji", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 112, ExamId = 2, Name = "AYT - Sosyoloji", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 113, ExamId = 2, Name = "AYT - Mantık", CreatedAt = new DateTime(2025, 6, 9) },

                new { Id = 201, ExamId = 3, Name = "Lgs - Türkçe", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 202, ExamId = 3, Name = "Lgs - İnkılâp Tarihi ve Atatürkçülük", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 203, ExamId = 3, Name = "Lgs - Din Kültürü ve Ahlâk Bilgisi", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 204, ExamId = 3, Name = "Lgs - İngilizce", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 205, ExamId = 3, Name = "Lgs - Fen Bilimleri", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 206, ExamId = 3, Name = "Lgs - Matematik", CreatedAt = new DateTime(2025, 6, 9) },

                new { Id = 301, ExamId = 4, Name = "KPSS - Türkçe", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 302, ExamId = 4, Name = "KPSS - Matematik", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 303, ExamId = 4, Name = "KPSS - Geometri", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 304, ExamId = 4, Name = "KPSS - Tarih", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 305, ExamId = 4, Name = "KPSS - Coğrafya", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 306, ExamId = 4, Name = "KPSS - Vatandaşlık", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 307, ExamId = 4, Name = "KPSS - Güncel Bilgiler", CreatedAt = new DateTime(2025, 6, 9) },

                new { Id = 401, ExamId = 5, Name = "DGS - Matematik", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 402, ExamId = 5, Name = "DGS - Türkçe", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 403, ExamId = 5, Name = "DGS - Geometri", CreatedAt = new DateTime(2025, 6, 9) }
            );
        }
    }
}
