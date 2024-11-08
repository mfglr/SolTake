using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.SouthKorea.Suneung
{
    public class Seneung_English_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 3001, TopicId = 30001 },
                    new { SubjectId = 3001, TopicId = 30002 },
                    new { SubjectId = 3001, TopicId = 30003 },
                    new { SubjectId = 3001, TopicId = 30004 },
                    new { SubjectId = 3001, TopicId = 30005 },
                    new { SubjectId = 3001, TopicId = 30006 }
                );
        }
    }
}
