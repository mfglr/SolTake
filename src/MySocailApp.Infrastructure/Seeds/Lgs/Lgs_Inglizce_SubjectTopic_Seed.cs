using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Lgs
{
    public class Lgs_Inglizce_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 204, TopicId = 15001 },
                        new { SubjectId = 204, TopicId = 15002 },
                        new { SubjectId = 204, TopicId = 15003 },
                        new { SubjectId = 204, TopicId = 15004 },
                        new { SubjectId = 204, TopicId = 15005 },
                        new { SubjectId = 204, TopicId = 15006 },
                        new { SubjectId = 204, TopicId = 15007 },
                        new { SubjectId = 204, TopicId = 15008 },
                        new { SubjectId = 204, TopicId = 15009 },
                        new { SubjectId = 204, TopicId = 15010 },
                    ]
                );
        }
    }
}
