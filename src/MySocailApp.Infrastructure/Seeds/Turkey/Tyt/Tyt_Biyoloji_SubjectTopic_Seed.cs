using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Turkey.Tyt
{
    public class Tyt_Biyoloji_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 10, TopicId = 1001 },
                        new { SubjectId = 10, TopicId = 1002 },
                        new { SubjectId = 10, TopicId = 1003 },
                        new { SubjectId = 10, TopicId = 1004 },
                        new { SubjectId = 10, TopicId = 1005 },
                        new { SubjectId = 10, TopicId = 1006 },
                        new { SubjectId = 10, TopicId = 1007 },
                        new { SubjectId = 10, TopicId = 1008 },
                    ]
                );
        }
    }
}
