using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.ExamAggregate.Entitities;

namespace SolTake.Infrastructure.Seeds
{
    public class ExamSeed : IEntityTypeConfiguration<Exam>
    {
        public void Configure(EntityTypeBuilder<Exam> builder)
        {
            builder.HasData(
                new { Id = 1, ShortName = "TYT", FullName = "Temel Yeterlilik Testi", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 2, ShortName = "AYT", FullName = "Alan Yeterlilik Testi", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 3, ShortName = "LGS", FullName = "Liselere Geçiş Sistemi", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 4, ShortName = "KPSS", FullName = "Kamu Personeli Seçme Sınavı", CreatedAt = new DateTime(2025, 6, 9) },
                new { Id = 5, ShortName = "DGS", FullName = "Dikey Geçiş Sınavı", CreatedAt = new DateTime(2025, 6, 9) }
            );
        }
    }
}
