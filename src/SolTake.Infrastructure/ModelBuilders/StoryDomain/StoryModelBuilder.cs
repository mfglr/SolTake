using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.StoryAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.StoryDomain
{
    internal class StoryModelBuilder : IEntityTypeConfiguration<Story>
    {
        public void Configure(EntityTypeBuilder<Story> builder)
        {
            builder.OwnsOne(x => x.Media);
        }
    }
}
