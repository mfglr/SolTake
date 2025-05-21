using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Ayt
{
    public class Ayt_Biyoloji_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 105, TopicId = 1009 },
                        new { SubjectId = 105, TopicId = 1010 },
                        new { SubjectId = 105, TopicId = 1011 },
                        new { SubjectId = 105, TopicId = 1012 },
                        new { SubjectId = 105, TopicId = 1013 },
                        new { SubjectId = 105, TopicId = 1014 },
                        new { SubjectId = 105, TopicId = 1015 },
                        new { SubjectId = 105, TopicId = 1016 },
                        new { SubjectId = 105, TopicId = 1017 },
                        new { SubjectId = 105, TopicId = 1018 },
                        new { SubjectId = 105, TopicId = 1019 },
                        new { SubjectId = 105, TopicId = 1020 },
                        new { SubjectId = 105, TopicId = 1021 },
                        new { SubjectId = 105, TopicId = 1022 },
                        new { SubjectId = 105, TopicId = 1023 },
                        new { SubjectId = 105, TopicId = 1024 },
                        new { SubjectId = 105, TopicId = 1025 },
                        new { SubjectId = 105, TopicId = 1026 },
                        new { SubjectId = 105, TopicId = 1027 },
                        new { SubjectId = 105, TopicId = 1028 },
                        new { SubjectId = 105, TopicId = 1029 },
                    ]
                );
        }
    }
}
