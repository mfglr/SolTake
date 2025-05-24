using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds.Kpss
{
    public class Kpss_GuncelBilgiler_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 307, TopicId = 18001 },
                    new { SubjectId = 307, TopicId = 18002 },
                    new { SubjectId = 307, TopicId = 18003 },
                    new { SubjectId = 307, TopicId = 18004 },
                    new { SubjectId = 307, TopicId = 18005 }
                );
        }
    }
}
