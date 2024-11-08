using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.SouthKorea.Suneung
{
    public class Suneung_Hangugsa_KoreanHistory_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 4001, TopicId = 40001 },
                    new { SubjectId = 4001, TopicId = 40002 },
                    new { SubjectId = 4001, TopicId = 40003 },
                    new { SubjectId = 4001, TopicId = 40004 },
                    new { SubjectId = 4001, TopicId = 40005 },
                    new { SubjectId = 4001, TopicId = 40006 },
                    new { SubjectId = 4001, TopicId = 40007 },
                    new { SubjectId = 4001, TopicId = 40008 },
                    new { SubjectId = 4001, TopicId = 40009 },
                    new { SubjectId = 4001, TopicId = 40010 },
                    new { SubjectId = 4001, TopicId = 40011 },
                    new { SubjectId = 4001, TopicId = 40012 },
                    new { SubjectId = 4001, TopicId = 40013 },
                    new { SubjectId = 4001, TopicId = 40014 },
                    new { SubjectId = 4001, TopicId = 40015 },
                    new { SubjectId = 4001, TopicId = 40016 },
                    new { SubjectId = 4001, TopicId = 40017 },
                    new { SubjectId = 4001, TopicId = 40018 },
                    new { SubjectId = 4001, TopicId = 40019 },
                    new { SubjectId = 4001, TopicId = 40020 },
                    new { SubjectId = 4001, TopicId = 40021 },
                    new { SubjectId = 4001, TopicId = 40022 },
                    new { SubjectId = 4001, TopicId = 40023 },
                    new { SubjectId = 4001, TopicId = 40024 },
                    new { SubjectId = 4001, TopicId = 40025 },
                    new { SubjectId = 4001, TopicId = 40026 },
                    new { SubjectId = 4001, TopicId = 40027 },
                    new { SubjectId = 4001, TopicId = 40028 },
                    new { SubjectId = 4001, TopicId = 40029 },
                    new { SubjectId = 4001, TopicId = 40030 },
                    new { SubjectId = 4001, TopicId = 40031 },
                    new { SubjectId = 4001, TopicId = 40032 },
                    new { SubjectId = 4001, TopicId = 40033 },
                    new { SubjectId = 4001, TopicId = 40034 },
                    new { SubjectId = 4001, TopicId = 40035 },
                    new { SubjectId = 4001, TopicId = 40036 },
                    new { SubjectId = 4001, TopicId = 40037 },
                    new { SubjectId = 4001, TopicId = 40038 },
                    new { SubjectId = 4001, TopicId = 40039 },
                    new { SubjectId = 4001, TopicId = 40040 }
                );
        }
    }
}
