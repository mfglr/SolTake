using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Ayt
{
    public class Ayt_Tarih_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 107, TopicId = 8018 },
                    new { SubjectId = 107, TopicId = 8019 },
                    new { SubjectId = 107, TopicId = 8020 },
                    new { SubjectId = 107, TopicId = 8021 },
                    new { SubjectId = 107, TopicId = 8022 },
                    new { SubjectId = 107, TopicId = 8023 },
                    new { SubjectId = 107, TopicId = 8024 },
                    new { SubjectId = 107, TopicId = 8025 },
                    new { SubjectId = 107, TopicId = 8026 },
                    new { SubjectId = 107, TopicId = 8027 },
                    new { SubjectId = 107, TopicId = 8044 },
                    new { SubjectId = 107, TopicId = 8045 },
                    new { SubjectId = 107, TopicId = 8046 },
                    new { SubjectId = 107, TopicId = 8047 },
                    new { SubjectId = 107, TopicId = 8048 },
                    new { SubjectId = 107, TopicId = 8049 },
                    new { SubjectId = 107, TopicId = 8050 },
                    new { SubjectId = 107, TopicId = 8051 },
                    new { SubjectId = 107, TopicId = 8052 },
                    new { SubjectId = 107, TopicId = 8053 },
                    new { SubjectId = 107, TopicId = 8054 },
                    new { SubjectId = 107, TopicId = 8055 },
                    new { SubjectId = 107, TopicId = 8056 },
                    new { SubjectId = 107, TopicId = 8057 },
                    new { SubjectId = 107, TopicId = 8058 },
                    new { SubjectId = 107, TopicId = 8059 }
                );
        }
    }
}
