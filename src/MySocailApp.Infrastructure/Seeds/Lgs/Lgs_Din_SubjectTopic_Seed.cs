using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Lgs
{
    public class Lgs_Din_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 203, TopicId = 3017 },
                        new { SubjectId = 203, TopicId = 3018 },
                        new { SubjectId = 203, TopicId = 3019 },
                        new { SubjectId = 203, TopicId = 3020 },
                        new { SubjectId = 203, TopicId = 3021 }
                    ]
                );
        }
    }
}
