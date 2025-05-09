﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AIModelAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.AIModelAggregate
{
    public class AIModelModelBuilder : IEntityTypeConfiguration<AIModel>
    {
        public void Configure(EntityTypeBuilder<AIModel> builder)
        {
            builder.OwnsOne(x => x.Name);
            builder.OwnsOne(x => x.SolPerInputToken);
            builder.OwnsOne(x => x.SolPerOutputToken);
            builder.OwnsOne(x => x.Image);
        }
    }
}
