using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ExamAggregate;

namespace MySocailApp.Infrastructure.Seeds
{
    public class ExamSeed : IEntityTypeConfiguration<Exam>
    {
        public void Configure(EntityTypeBuilder<Exam> builder)
        {
            builder.HasData(
                new { Id = 1, CreatedAt = DateTime.UtcNow, ShortName = "TYT", FullName = "Temel Yeterlilik Testi" },
                new { Id = 2, CreatedAt = DateTime.UtcNow, ShortName = "AYT", FullName = "Alan Yeterlilik Testi" }
            );
        }
    }
}
