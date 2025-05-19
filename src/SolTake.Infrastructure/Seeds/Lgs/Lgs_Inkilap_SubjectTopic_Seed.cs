using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Lgs
{
    public class Lgs_Inkilap_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 202, TopicId = 14001 },
                        new { SubjectId = 202, TopicId = 14002 },
                        new { SubjectId = 202, TopicId = 14003 },
                        new { SubjectId = 202, TopicId = 14004 },
                        new { SubjectId = 202, TopicId = 14005 },
                        new { SubjectId = 202, TopicId = 14006 },
                        new { SubjectId = 202, TopicId = 14007 },
                    ]
                );
        }
    }
}
