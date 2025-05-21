using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Ayt
{
    public class Ayt_Fizik_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 103, TopicId = 5015 },
                        new { SubjectId = 103, TopicId = 5016 },
                        new { SubjectId = 103, TopicId = 5017 },
                        new { SubjectId = 103, TopicId = 5018 },
                        new { SubjectId = 103, TopicId = 5019 },
                        new { SubjectId = 103, TopicId = 5020 },
                        new { SubjectId = 103, TopicId = 5021 },
                        new { SubjectId = 103, TopicId = 5022 },
                        new { SubjectId = 103, TopicId = 5023 },
                        new { SubjectId = 103, TopicId = 5024 },
                        new { SubjectId = 103, TopicId = 5025 },
                        new { SubjectId = 103, TopicId = 5026 },
                        new { SubjectId = 103, TopicId = 5027 },
                        new { SubjectId = 103, TopicId = 5028 },
                        new { SubjectId = 103, TopicId = 5029 },
                        new { SubjectId = 103, TopicId = 5030 },
                        new { SubjectId = 103, TopicId = 5031 },
                        new { SubjectId = 103, TopicId = 5032 },
                        new { SubjectId = 103, TopicId = 5033 },
                        new { SubjectId = 103, TopicId = 5034 },
                        new { SubjectId = 103, TopicId = 5035 },
                        new { SubjectId = 103, TopicId = 5036 },
                        new { SubjectId = 103, TopicId = 5037 },
                        new { SubjectId = 103, TopicId = 5038 },
                        new { SubjectId = 103, TopicId = 5039 }
                    ]
                );
        }
    }
}
