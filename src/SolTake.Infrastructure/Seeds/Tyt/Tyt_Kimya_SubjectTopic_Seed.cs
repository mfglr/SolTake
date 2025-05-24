using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds.Tyt
{
    public class Tyt_Kimya_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 9, TopicId = 7001 },
                        new { SubjectId = 9, TopicId = 7002 },
                        new { SubjectId = 9, TopicId = 7003 },
                        new { SubjectId = 9, TopicId = 7004 },
                        new { SubjectId = 9, TopicId = 7005 },
                        new { SubjectId = 9, TopicId = 7006 },
                        new { SubjectId = 9, TopicId = 7007 },
                        new { SubjectId = 9, TopicId = 7008 },
                        new { SubjectId = 9, TopicId = 7009 },
                        new { SubjectId = 9, TopicId = 7010 },
                        new { SubjectId = 9, TopicId = 7011 },
                    ]
                );
        }
    }
}
