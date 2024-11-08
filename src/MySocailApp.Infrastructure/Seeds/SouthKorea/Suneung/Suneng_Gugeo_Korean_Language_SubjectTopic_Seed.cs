using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.SouthKorea.Suneung
{
    public class Suneng_Gugeo_Korean_Language_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    new { SubjectId = 2001, TopicId = 20001 },
                    new { SubjectId = 2001, TopicId = 20002 },
                    new { SubjectId = 2001, TopicId = 20003 },
                    new { SubjectId = 2001, TopicId = 20004 },
                    new { SubjectId = 2001, TopicId = 20005 },
                    new { SubjectId = 2001, TopicId = 20006 },
                    new { SubjectId = 2001, TopicId = 20007 },
                    new { SubjectId = 2001, TopicId = 20008 },
                    new { SubjectId = 2001, TopicId = 20009 },
                    new { SubjectId = 2001, TopicId = 20010 },
                    new { SubjectId = 2001, TopicId = 20011 },
                    new { SubjectId = 2001, TopicId = 20012 },
                    new { SubjectId = 2001, TopicId = 20013 },
                    new { SubjectId = 2001, TopicId = 20014 },
                    new { SubjectId = 2001, TopicId = 20015 },
                    new { SubjectId = 2001, TopicId = 20016 },
                    new { SubjectId = 2001, TopicId = 20017 },
                    new { SubjectId = 2001, TopicId = 20018 },
                    new { SubjectId = 2001, TopicId = 20019 },
                    new { SubjectId = 2001, TopicId = 20020 },
                    new { SubjectId = 2001, TopicId = 20021 },
                    new { SubjectId = 2001, TopicId = 20022 },
                    new { SubjectId = 2001, TopicId = 20023 },
                    new { SubjectId = 2001, TopicId = 20024 },
                    new { SubjectId = 2001, TopicId = 20025 },
                    new { SubjectId = 2001, TopicId = 20026 },
                    new { SubjectId = 2001, TopicId = 20027 },
                    new { SubjectId = 2001, TopicId = 20028 },
                    new { SubjectId = 2001, TopicId = 20029 },
                    new { SubjectId = 2001, TopicId = 20030 },
                    new { SubjectId = 2001, TopicId = 20031 },
                    new { SubjectId = 2001, TopicId = 20032 },
                    new { SubjectId = 2001, TopicId = 20033 },
                    new { SubjectId = 2001, TopicId = 20034 },
                    new { SubjectId = 2001, TopicId = 20035 }
                );
        }
    }
}
