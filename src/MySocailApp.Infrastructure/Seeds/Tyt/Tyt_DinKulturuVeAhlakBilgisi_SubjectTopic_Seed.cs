﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds.Tyt
{
    public class Tyt_DinKulturuVeAhlakBilgisi_SubjectTopic_Seed : IEntityTypeConfiguration<SubjectTopic>
    {
        public void Configure(EntityTypeBuilder<SubjectTopic> builder)
        {
            builder
                .HasData(
                    [
                        new { SubjectId = 5, TopicId = 3001 },
                        new { SubjectId = 5, TopicId = 3002 },
                        new { SubjectId = 5, TopicId = 3003 },
                        new { SubjectId = 5, TopicId = 3004 },
                        new { SubjectId = 5, TopicId = 3005 },
                        new { SubjectId = 5, TopicId = 3006 },
                        new { SubjectId = 5, TopicId = 3007 },
                        new { SubjectId = 5, TopicId = 3008 },
                        new { SubjectId = 5, TopicId = 3009 },
                        new { SubjectId = 5, TopicId = 3010 },
                        new { SubjectId = 5, TopicId = 3011 },
                        new { SubjectId = 5, TopicId = 3012 },
                        new { SubjectId = 5, TopicId = 3013 },
                        new { SubjectId = 5, TopicId = 3014 },
                        new { SubjectId = 5, TopicId = 3015 },
                        new { SubjectId = 5, TopicId = 3016 },
                    ]
                );

        }
    }
}
