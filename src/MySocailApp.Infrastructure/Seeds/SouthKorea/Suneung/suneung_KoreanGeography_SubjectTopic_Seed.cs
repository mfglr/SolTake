using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.SouthKorea.Suneung
{
    public class Suneung_KoreanGeography_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 7001, TopicId = 70001 },
                    new { SubjectId = 7001, TopicId = 70002 },
                    new { SubjectId = 7001, TopicId = 70003 },
                    new { SubjectId = 7001, TopicId = 70004 },
                    new { SubjectId = 7001, TopicId = 70005 },
                    new { SubjectId = 7001, TopicId = 70006 },
                    new { SubjectId = 7001, TopicId = 70007 },
                    new { SubjectId = 7001, TopicId = 70008 },
                    new { SubjectId = 7001, TopicId = 70009 },
                    new { SubjectId = 7001, TopicId = 70010 },
                    new { SubjectId = 7001, TopicId = 70011 },
                    new { SubjectId = 7001, TopicId = 70012 },
                    new { SubjectId = 7001, TopicId = 70013 },
                    new { SubjectId = 7001, TopicId = 70014 },
                    new { SubjectId = 7001, TopicId = 70015 },
                    new { SubjectId = 7001, TopicId = 70016 },
                    new { SubjectId = 7001, TopicId = 70017 },
                    new { SubjectId = 7001, TopicId = 70018 },
                    new { SubjectId = 7001, TopicId = 70019 },
                    new { SubjectId = 7001, TopicId = 70020 },
                    new { SubjectId = 7001, TopicId = 70021 },
                    new { SubjectId = 7001, TopicId = 70022 },
                    new { SubjectId = 7001, TopicId = 70023 },
                    new { SubjectId = 7001, TopicId = 70024 },
                    new { SubjectId = 7001, TopicId = 70025 },
                    new { SubjectId = 7001, TopicId = 70026 },
                    new { SubjectId = 7001, TopicId = 70027 },
                    new { SubjectId = 7001, TopicId = 70028 },
                    new { SubjectId = 7001, TopicId = 70029 },
                    new { SubjectId = 7001, TopicId = 70030 },
                    new { SubjectId = 7001, TopicId = 70031 },
                    new { SubjectId = 7001, TopicId = 70032 },
                    new { SubjectId = 7001, TopicId = 70033 },
                    new { SubjectId = 7001, TopicId = 70034 },
                    new { SubjectId = 7001, TopicId = 70035 },
                    new { SubjectId = 7001, TopicId = 70036 },
                    new { SubjectId = 7001, TopicId = 70037 },
                    new { SubjectId = 7001, TopicId = 70038 }
                );
        }
    }
}
