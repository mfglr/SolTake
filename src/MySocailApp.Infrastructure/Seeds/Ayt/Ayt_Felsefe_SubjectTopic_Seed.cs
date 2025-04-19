using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Ayt
{
    public class Ayt_Felsefe_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 110, TopicId = 4001 },
                        new { SubjectId = 110, TopicId = 4002 },
                        new { SubjectId = 110, TopicId = 4003 },
                        new { SubjectId = 110, TopicId = 4004 },
                        new { SubjectId = 110, TopicId = 4005 },
                        new { SubjectId = 110, TopicId = 4006 },
                        new { SubjectId = 110, TopicId = 4007 },
                        new { SubjectId = 110, TopicId = 4008 },
                        new { SubjectId = 110, TopicId = 4009 },
                        new { SubjectId = 110, TopicId = 4010 },
                        new { SubjectId = 110, TopicId = 4011 },
                        new { SubjectId = 110, TopicId = 4012 },
                        new { SubjectId = 110, TopicId = 4013 },
                        new { SubjectId = 110, TopicId = 4014 },
                        new { SubjectId = 110, TopicId = 4015 },
                    ]
                );
        }
    }
}
