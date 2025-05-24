using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds.Kpss
{
    public class Kpss_Tarih_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 304, TopicId = 8001 },
                    new { SubjectId = 304, TopicId = 8002 },
                    new { SubjectId = 304, TopicId = 8003 },
                    new { SubjectId = 304, TopicId = 8004 },
                    new { SubjectId = 304, TopicId = 8005 },
                    new { SubjectId = 304, TopicId = 8006 },
                    new { SubjectId = 304, TopicId = 8007 },
                    new { SubjectId = 304, TopicId = 8008 },
                    new { SubjectId = 304, TopicId = 8009 },
                    new { SubjectId = 304, TopicId = 8010 },
                    new { SubjectId = 304, TopicId = 8011 },
                    new { SubjectId = 304, TopicId = 8012 },
                    new { SubjectId = 304, TopicId = 8013 },
                    new { SubjectId = 304, TopicId = 8014 },
                    new { SubjectId = 304, TopicId = 8015 },
                    new { SubjectId = 304, TopicId = 8016 },
                    new { SubjectId = 304, TopicId = 8017 }
                );
        }
    }
}
