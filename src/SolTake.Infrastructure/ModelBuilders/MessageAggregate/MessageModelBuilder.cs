using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.MessageAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.MessageAggregate
{
    public class MessageModelBuilder : IEntityTypeConfiguration<Message>
    {
        public void Configure(EntityTypeBuilder<Message> builder)
        {
            builder.OwnsOne(x => x.Content);
            builder.OwnsMany(x => x.Medias);
        }
    }
}
