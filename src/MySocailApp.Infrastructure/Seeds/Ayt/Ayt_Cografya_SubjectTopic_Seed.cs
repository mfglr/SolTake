using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Ayt
{
    public class Ayt_Cografya_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 106, TopicId = 2080 },
                        new { SubjectId = 106, TopicId = 2081 },
                        new { SubjectId = 106, TopicId = 2082 },
                        new { SubjectId = 106, TopicId = 2083 },
                        new { SubjectId = 106, TopicId = 2084 },
                        new { SubjectId = 106, TopicId = 2085 },
                        new { SubjectId = 106, TopicId = 2086 },
                        new { SubjectId = 106, TopicId = 2087 },
                        new { SubjectId = 106, TopicId = 2088 },
                        new { SubjectId = 106, TopicId = 2089 },
                        new { SubjectId = 106, TopicId = 2090 },
                        new { SubjectId = 106, TopicId = 2091 },
                        new { SubjectId = 106, TopicId = 2092 },
                        new { SubjectId = 106, TopicId = 2093 },
                        new { SubjectId = 106, TopicId = 2094 },
                        new { SubjectId = 106, TopicId = 2095 },
                        new { SubjectId = 106, TopicId = 2096 },
                        new { SubjectId = 106, TopicId = 2097 },
                        new { SubjectId = 106, TopicId = 2098 },
                        new { SubjectId = 106, TopicId = 2099 },
                        new { SubjectId = 106, TopicId = 2100 },
                        new { SubjectId = 106, TopicId = 2101 },
                        new { SubjectId = 106, TopicId = 2102 },
                        new { SubjectId = 106, TopicId = 2103 },
                        new { SubjectId = 106, TopicId = 2104 },
                        new { SubjectId = 106, TopicId = 2105 },
                        new { SubjectId = 106, TopicId = 2106 },
                        new { SubjectId = 106, TopicId = 2107 },
                        new { SubjectId = 106, TopicId = 2108 },
                        new { SubjectId = 106, TopicId = 2109 },
                        new { SubjectId = 106, TopicId = 2110 },
                        new { SubjectId = 106, TopicId = 2111 },
                        new { SubjectId = 106, TopicId = 2112 },
                        new { SubjectId = 106, TopicId = 2113 },
                        new { SubjectId = 106, TopicId = 2114 },
                        new { SubjectId = 106, TopicId = 2115 },
                        new { SubjectId = 106, TopicId = 2116 },
                        new { SubjectId = 106, TopicId = 2117 },
                        new { SubjectId = 106, TopicId = 2118 },
                        new { SubjectId = 106, TopicId = 2119 },
                        new { SubjectId = 106, TopicId = 2120 },
                        new { SubjectId = 106, TopicId = 2121 },
                        new { SubjectId = 106, TopicId = 2122 },
                    ]
                );
        }
    }
}
