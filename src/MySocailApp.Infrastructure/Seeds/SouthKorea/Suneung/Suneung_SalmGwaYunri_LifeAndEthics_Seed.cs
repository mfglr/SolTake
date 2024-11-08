using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.SouthKorea.Suneung
{
    public class Suneung_SalmGwaYunri_LifeAndEthics_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 5001, TopicId = 50001 },
                    new { SubjectId = 5001, TopicId = 50002 },
                    new { SubjectId = 5001, TopicId = 50003 },
                    new { SubjectId = 5001, TopicId = 50004 },
                    new { SubjectId = 5001, TopicId = 50005 },
                    new { SubjectId = 5001, TopicId = 50006 },
                    new { SubjectId = 5001, TopicId = 50007 },
                    new { SubjectId = 5001, TopicId = 50008 },
                    new { SubjectId = 5001, TopicId = 50009 },
                    new { SubjectId = 5001, TopicId = 50010 },
                    new { SubjectId = 5001, TopicId = 50011 },
                    new { SubjectId = 5001, TopicId = 50012 },
                    new { SubjectId = 5001, TopicId = 50013 },
                    new { SubjectId = 5001, TopicId = 50014 },
                    new { SubjectId = 5001, TopicId = 50015 },
                    new { SubjectId = 5001, TopicId = 50016 },
                    new { SubjectId = 5001, TopicId = 50017 },
                    new { SubjectId = 5001, TopicId = 50018 },
                    new { SubjectId = 5001, TopicId = 50019 },
                    new { SubjectId = 5001, TopicId = 50020 },
                    new { SubjectId = 5001, TopicId = 50021 },
                    new { SubjectId = 5001, TopicId = 50022 },
                    new { SubjectId = 5001, TopicId = 50023 },
                    new { SubjectId = 5001, TopicId = 50024 },
                    new { SubjectId = 5001, TopicId = 50025 },
                    new { SubjectId = 5001, TopicId = 50026 },
                    new { SubjectId = 5001, TopicId = 50027 },
                    new { SubjectId = 5001, TopicId = 50028 },
                    new { SubjectId = 5001, TopicId = 50029 },
                    new { SubjectId = 5001, TopicId = 50030 }
                );
        }
    }
}
