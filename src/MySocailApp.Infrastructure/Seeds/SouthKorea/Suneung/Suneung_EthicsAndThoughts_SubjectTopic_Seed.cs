using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.SouthKorea.Suneung
{
    public class Suneung_EthicsAndThoughts_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 6001, TopicId = 60001 },
                    new { SubjectId = 6001, TopicId = 60002 },
                    new { SubjectId = 6001, TopicId = 60003 },
                    new { SubjectId = 6001, TopicId = 60004 },
                    new { SubjectId = 6001, TopicId = 60005 },
                    new { SubjectId = 6001, TopicId = 60006 },
                    new { SubjectId = 6001, TopicId = 60007 },
                    new { SubjectId = 6001, TopicId = 60008 },
                    new { SubjectId = 6001, TopicId = 60009 },
                    new { SubjectId = 6001, TopicId = 60010 },
                    new { SubjectId = 6001, TopicId = 60011 },
                    new { SubjectId = 6001, TopicId = 60012 },
                    new { SubjectId = 6001, TopicId = 60013 },
                    new { SubjectId = 6001, TopicId = 60014 },
                    new { SubjectId = 6001, TopicId = 60015 },
                    new { SubjectId = 6001, TopicId = 60016 },
                    new { SubjectId = 6001, TopicId = 60017 },
                    new { SubjectId = 6001, TopicId = 60018 },
                    new { SubjectId = 6001, TopicId = 60019 },
                    new { SubjectId = 6001, TopicId = 60020 },
                    new { SubjectId = 6001, TopicId = 60021 },
                    new { SubjectId = 6001, TopicId = 60022 },
                    new { SubjectId = 6001, TopicId = 60023 },
                    new { SubjectId = 6001, TopicId = 60024 },
                    new { SubjectId = 6001, TopicId = 60025 },
                    new { SubjectId = 6001, TopicId = 60026 },
                    new { SubjectId = 6001, TopicId = 60027 },
                    new { SubjectId = 6001, TopicId = 60028 },
                    new { SubjectId = 6001, TopicId = 60029 },
                    new { SubjectId = 6001, TopicId = 60030 },
                    new { SubjectId = 6001, TopicId = 60031 },
                    new { SubjectId = 6001, TopicId = 60032 },
                    new { SubjectId = 6001, TopicId = 60033 },
                    new { SubjectId = 6001, TopicId = 60034 },
                    new { SubjectId = 6001, TopicId = 60035 },
                    new { SubjectId = 6001, TopicId = 60036 },
                    new { SubjectId = 6001, TopicId = 60037 },
                    new { SubjectId = 6001, TopicId = 60038 }
                );
        }
    }
}
