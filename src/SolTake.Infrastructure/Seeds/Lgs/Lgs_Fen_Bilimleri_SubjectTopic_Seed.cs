using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Infrastructure.Seeds.Lgs
{
    internal class Lgs_Fen_Bilimleri_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 205, TopicId = 16001 },
                        new { SubjectId = 205, TopicId = 16002 },
                        new { SubjectId = 205, TopicId = 16003 },
                        new { SubjectId = 205, TopicId = 16004 },
                        new { SubjectId = 205, TopicId = 16005 },
                        new { SubjectId = 205, TopicId = 16006 },
                        new { SubjectId = 205, TopicId = 16007 },
                        new { SubjectId = 205, TopicId = 16008 },
                        new { SubjectId = 205, TopicId = 16009 },
                        new { SubjectId = 205, TopicId = 16010 },
                        new { SubjectId = 205, TopicId = 16011 },
                    ]
                );
        }
    }
}
