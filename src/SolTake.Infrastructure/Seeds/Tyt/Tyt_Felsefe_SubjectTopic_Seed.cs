using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds.Tyt
{
    public class Tyt_Felsefe_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 4, TopicId = 4001 },
                        new { SubjectId = 4, TopicId = 4002 },
                        new { SubjectId = 4, TopicId = 4003 },
                        new { SubjectId = 4, TopicId = 4004 },
                        new { SubjectId = 4, TopicId = 4005 },
                        new { SubjectId = 4, TopicId = 4006 },
                        new { SubjectId = 4, TopicId = 4007 },
                        new { SubjectId = 4, TopicId = 4008 },
                        new { SubjectId = 4, TopicId = 4009 },
                    ]
                );
        }
    }
}
