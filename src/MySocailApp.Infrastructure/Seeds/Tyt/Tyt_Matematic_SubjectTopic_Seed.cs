using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Tyt
{
    public class Tyt_Matematic_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 6, TopicId = 1 },
                    new { SubjectId = 6, TopicId = 2 },
                    new { SubjectId = 6, TopicId = 3 },
                    new { SubjectId = 6, TopicId = 4 },
                    new { SubjectId = 6, TopicId = 5 },
                    new { SubjectId = 6, TopicId = 6 },
                    new { SubjectId = 6, TopicId = 7 },
                    new { SubjectId = 6, TopicId = 8 },
                    new { SubjectId = 6, TopicId = 9 },
                    new { SubjectId = 6, TopicId = 10 },
                    new { SubjectId = 6, TopicId = 11 },
                    new { SubjectId = 6, TopicId = 12 },
                    new { SubjectId = 6, TopicId = 13 },
                    new { SubjectId = 6, TopicId = 14 },
                    new { SubjectId = 6, TopicId = 15 },
                    new { SubjectId = 6, TopicId = 16 },
                    new { SubjectId = 6, TopicId = 17 },
                    new { SubjectId = 6, TopicId = 18 },
                    new { SubjectId = 6, TopicId = 19 },
                    new { SubjectId = 6, TopicId = 20 },
                    new { SubjectId = 6, TopicId = 21 },
                    new { SubjectId = 6, TopicId = 22 },
                    new { SubjectId = 6, TopicId = 23 },
                    new { SubjectId = 6, TopicId = 24 },
                    new { SubjectId = 6, TopicId = 25 },
                    new { SubjectId = 6, TopicId = 26 },
                    new { SubjectId = 6, TopicId = 27 },
                    new { SubjectId = 6, TopicId = 28 },
                    new { SubjectId = 6, TopicId = 29 },
                    new { SubjectId = 6, TopicId = 30 },
                    new { SubjectId = 6, TopicId = 31 },
                    new { SubjectId = 6, TopicId = 32 },
                    new { SubjectId = 6, TopicId = 33 },
                    new { SubjectId = 6, TopicId = 34 },
                    new { SubjectId = 6, TopicId = 35 },
                    new { SubjectId = 6, TopicId = 36 },
                    new { SubjectId = 6, TopicId = 37 },
                    new { SubjectId = 6, TopicId = 38 },
                    new { SubjectId = 6, TopicId = 39 },
                    new { SubjectId = 6, TopicId = 40 },
                    new { SubjectId = 6, TopicId = 41 },
                    new { SubjectId = 6, TopicId = 42 },
                    new { SubjectId = 6, TopicId = 43 },
                    new { SubjectId = 6, TopicId = 44 },
                    new { SubjectId = 6, TopicId = 45 },
                    new { SubjectId = 6, TopicId = 46 },
                    new { SubjectId = 6, TopicId = 47 },
                    new { SubjectId = 6, TopicId = 48 },
                    new { SubjectId = 6, TopicId = 49 },
                    new { SubjectId = 6, TopicId = 50 },
                    new { SubjectId = 6, TopicId = 51 },
                    new { SubjectId = 6, TopicId = 52 },
                    new { SubjectId = 6, TopicId = 53 }
                );
        }
    }
}
