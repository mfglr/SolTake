using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Tyt
{
    public class TytFizikSubjectTopicSeed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 8, TopicId = 5001 },
                        new { SubjectId = 8, TopicId = 5002 },
                        new { SubjectId = 8, TopicId = 5003 },
                        new { SubjectId = 8, TopicId = 5004 },
                        new { SubjectId = 8, TopicId = 5005 },
                        new { SubjectId = 8, TopicId = 5006 },
                        new { SubjectId = 8, TopicId = 5007 },
                        new { SubjectId = 8, TopicId = 5008 },
                        new { SubjectId = 8, TopicId = 5009 },
                        new { SubjectId = 8, TopicId = 5010 },
                        new { SubjectId = 8, TopicId = 5011 },
                        new { SubjectId = 8, TopicId = 5012 },
                        new { SubjectId = 8, TopicId = 5013 },
                        new { SubjectId = 8, TopicId = 5014 },
                    ]
                );
        }
    }
}
