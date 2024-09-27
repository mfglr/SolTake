using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Tyt
{
    public class Tyt_Cografya_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 3, TopicId = 2061 },
                        new { SubjectId = 3, TopicId = 2062 },
                        new { SubjectId = 3, TopicId = 2063 },
                        new { SubjectId = 3, TopicId = 2064 },
                        new { SubjectId = 3, TopicId = 2065 },
                        new { SubjectId = 3, TopicId = 2066 },
                        new { SubjectId = 3, TopicId = 2067 },
                        new { SubjectId = 3, TopicId = 2068 },
                        new { SubjectId = 3, TopicId = 2069 },
                        new { SubjectId = 3, TopicId = 2070 },
                        new { SubjectId = 3, TopicId = 2071 },
                        new { SubjectId = 3, TopicId = 2072 },
                        new { SubjectId = 3, TopicId = 2073 },
                        new { SubjectId = 3, TopicId = 2074 },
                        new { SubjectId = 3, TopicId = 2075 },
                        new { SubjectId = 3, TopicId = 2076 },
                        new { SubjectId = 3, TopicId = 2077 },
                        new { SubjectId = 3, TopicId = 2078 },
                        new { SubjectId = 3, TopicId = 2079 },
                    ]
                );
        }
    }
}
