using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Ayt
{
    public class Ayt_Sosyaloji_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 112, TopicId = 13001 },
                        new { SubjectId = 112, TopicId = 13002 },
                        new { SubjectId = 112, TopicId = 13003 },
                        new { SubjectId = 112, TopicId = 13004 },
                        new { SubjectId = 112, TopicId = 13005 },
                        new { SubjectId = 112, TopicId = 13006 },
                    ]
                );
        }
    }
}
