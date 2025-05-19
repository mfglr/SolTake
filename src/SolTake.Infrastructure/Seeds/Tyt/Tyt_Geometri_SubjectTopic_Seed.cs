using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Tyt
{
    public class Tyt_Geometri_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 7, TopicId = 6001 },
                        new { SubjectId = 7, TopicId = 6002 },
                        new { SubjectId = 7, TopicId = 6003 },
                        new { SubjectId = 7, TopicId = 6004 },
                        new { SubjectId = 7, TopicId = 6005 },
                        new { SubjectId = 7, TopicId = 6006 },
                        new { SubjectId = 7, TopicId = 6007 },
                        new { SubjectId = 7, TopicId = 6008 },
                        new { SubjectId = 7, TopicId = 6009 },
                        new { SubjectId = 7, TopicId = 6010 },
                        new { SubjectId = 7, TopicId = 6011 },
                        new { SubjectId = 7, TopicId = 6012 },
                        new { SubjectId = 7, TopicId = 6013 },
                        new { SubjectId = 7, TopicId = 6014 },
                        new { SubjectId = 7, TopicId = 6015 },
                        new { SubjectId = 7, TopicId = 6016 },
                        new { SubjectId = 7, TopicId = 6017 },
                        new { SubjectId = 7, TopicId = 6018 },
                        new { SubjectId = 7, TopicId = 6019 },
                        new { SubjectId = 7, TopicId = 6020 },
                        new { SubjectId = 7, TopicId = 6021 },
                        new { SubjectId = 7, TopicId = 6022 },
                        new { SubjectId = 7, TopicId = 6023 },
                        new { SubjectId = 7, TopicId = 6024 },
                        new { SubjectId = 7, TopicId = 6025 },
                        new { SubjectId = 7, TopicId = 6026 },
                        new { SubjectId = 7, TopicId = 6027 },
                        new { SubjectId = 7, TopicId = 6028 },
                        new { SubjectId = 7, TopicId = 6029 },
                        new { SubjectId = 7, TopicId = 6030 },
                        new { SubjectId = 7, TopicId = 6031 },
                        new { SubjectId = 7, TopicId = 6032 },
                        new { SubjectId = 7, TopicId = 6033 },
                        new { SubjectId = 7, TopicId = 6034 },
                        new { SubjectId = 7, TopicId = 6035 },
                        new { SubjectId = 7, TopicId = 6036 },
                        new { SubjectId = 7, TopicId = 6037 },
                        new { SubjectId = 7, TopicId = 6038 },
                        new { SubjectId = 7, TopicId = 6039 },
                        new { SubjectId = 7, TopicId = 6040 },
                        new { SubjectId = 7, TopicId = 6041 },
                        new { SubjectId = 7, TopicId = 6042 },
                        new { SubjectId = 7, TopicId = 6043 },
                        new { SubjectId = 7, TopicId = 6044 },
                        new { SubjectId = 7, TopicId = 6045 },
                        new { SubjectId = 7, TopicId = 6046 },
                        new { SubjectId = 7, TopicId = 6047 },
                    ]
                );
        }
    }
}
