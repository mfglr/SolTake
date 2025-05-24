using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds.Lgs
{
    public class Lgs_Matematik_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 206, TopicId = 63 },
                    new { SubjectId = 206, TopicId = 64 },
                    new { SubjectId = 206, TopicId = 65 },
                    new { SubjectId = 206, TopicId = 66 },
                    new { SubjectId = 206, TopicId = 67 },
                    new { SubjectId = 206, TopicId = 68 },
                    new { SubjectId = 206, TopicId = 69 },
                    new { SubjectId = 206, TopicId = 70 },
                    new { SubjectId = 206, TopicId = 71 },
                    new { SubjectId = 206, TopicId = 72 },
                    new { SubjectId = 206, TopicId = 73 },
                    new { SubjectId = 206, TopicId = 74 }
                );
        }
    }
}
