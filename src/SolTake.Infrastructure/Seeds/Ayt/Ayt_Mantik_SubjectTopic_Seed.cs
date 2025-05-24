using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds.Ayt
{
    public class Ayt_Mantik_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 113, TopicId = 11001 },
                        new { SubjectId = 113, TopicId = 11002 },
                        new { SubjectId = 113, TopicId = 11003 },
                        new { SubjectId = 113, TopicId = 11004 },
                        new { SubjectId = 113, TopicId = 11005 },
                    ]
                );
        }
    }
}
