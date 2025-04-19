using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Ayt
{
    public class Ayt_Kimya_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 104, TopicId = 7001 },
                        new { SubjectId = 104, TopicId = 7002 },
                        new { SubjectId = 104, TopicId = 7003 },
                        new { SubjectId = 104, TopicId = 7004 },
                        new { SubjectId = 104, TopicId = 7005 },
                        new { SubjectId = 104, TopicId = 7006 },
                        new { SubjectId = 104, TopicId = 7007 },
                        new { SubjectId = 104, TopicId = 7008 },
                        new { SubjectId = 104, TopicId = 7009 },
                        new { SubjectId = 104, TopicId = 7010 },
                        new { SubjectId = 104, TopicId = 7011 },
                        new { SubjectId = 104, TopicId = 7012 },
                        new { SubjectId = 104, TopicId = 7013 },
                        new { SubjectId = 104, TopicId = 7014 },
                        new { SubjectId = 104, TopicId = 7015 },
                        new { SubjectId = 104, TopicId = 7016 },
                        new { SubjectId = 104, TopicId = 7017 },
                        new { SubjectId = 104, TopicId = 7018 },
                        new { SubjectId = 104, TopicId = 7019 },
                        new { SubjectId = 104, TopicId = 7020 },
                        new { SubjectId = 104, TopicId = 7021 },
                        new { SubjectId = 104, TopicId = 7022 },
                        new { SubjectId = 104, TopicId = 7023 },
                        new { SubjectId = 104, TopicId = 7024 },
                        new { SubjectId = 104, TopicId = 7025 },
                    ]
                );
        }
    }
}
