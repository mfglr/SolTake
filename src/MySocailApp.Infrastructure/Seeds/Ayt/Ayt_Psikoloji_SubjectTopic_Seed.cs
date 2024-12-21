using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Ayt
{
    public class Ayt_Psikoloji_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 111, TopicId = 12001 },
                        new { SubjectId = 111, TopicId = 12002 },
                        new { SubjectId = 111, TopicId = 12003 },
                        new { SubjectId = 111, TopicId = 12004 },
                    ]
                );
        }
    }
}
