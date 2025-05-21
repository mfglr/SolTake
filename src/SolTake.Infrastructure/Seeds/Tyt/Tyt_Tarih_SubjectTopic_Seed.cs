using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Tyt
{
    public class Tyt_Tarih_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 2, TopicId = 8018 },
                    new { SubjectId = 2, TopicId = 8019 },
                    new { SubjectId = 2, TopicId = 8020 },
                    new { SubjectId = 2, TopicId = 8021 },
                    new { SubjectId = 2, TopicId = 8022 },
                    new { SubjectId = 2, TopicId = 8023 },
                    new { SubjectId = 2, TopicId = 8024 },
                    new { SubjectId = 2, TopicId = 8025 },
                    new { SubjectId = 2, TopicId = 8026 },
                    new { SubjectId = 2, TopicId = 8027 },
                    new { SubjectId = 2, TopicId = 8028 },
                    new { SubjectId = 2, TopicId = 8029 },
                    new { SubjectId = 2, TopicId = 8030 },
                    new { SubjectId = 2, TopicId = 8031 },
                    new { SubjectId = 2, TopicId = 8032 },
                    new { SubjectId = 2, TopicId = 8033 },
                    new { SubjectId = 2, TopicId = 8034 },
                    new { SubjectId = 2, TopicId = 8035 },
                    new { SubjectId = 2, TopicId = 8036 },
                    new { SubjectId = 2, TopicId = 8037 },
                    new { SubjectId = 2, TopicId = 8038 },
                    new { SubjectId = 2, TopicId = 8039 },
                    new { SubjectId = 2, TopicId = 8040 },
                    new { SubjectId = 2, TopicId = 8041 },
                    new { SubjectId = 2, TopicId = 8042 },
                    new { SubjectId = 2, TopicId = 8043 }
                );
        }
    }
}
