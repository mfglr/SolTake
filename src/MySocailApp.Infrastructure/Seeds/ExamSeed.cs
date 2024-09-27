using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ExamAggregate.Entitities;

namespace MySocailApp.Infrastructure.Seeds
{
    public class ExamSeed : IEntityTypeConfiguration<Exam>
    {
        public void Configure(EntityTypeBuilder<Exam> builder)
        {
            builder.HasData(
                new { Id = 1, ShortName = "TYT", FullName = "Temel Yeterlilik Testi" },
                new { Id = 2, ShortName = "AYT", FullName = "Alan Yeterlilik Testi" },
                new { Id = 3, ShortName = "LGS", FullName = "Liselere Geçiş Sistemi" },
                new { Id = 4, ShortName = "KPSS", FullName = "Kamu Personeli Seçme Sınavı" }
            );
        }
    }
}
