using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.AIModelAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.AIModelAggregate
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
