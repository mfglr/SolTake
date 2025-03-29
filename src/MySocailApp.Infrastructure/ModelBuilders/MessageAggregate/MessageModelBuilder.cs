using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.MessageAggregate
{
    public class MessageModelBuilder : IEntityTypeConfiguration<Message>
    {
        public void Configure(EntityTypeBuilder<Message> builder)
        {
            builder.OwnsOne(x => x.Content);

            builder
                .HasMany(x => x.Medias)
                .WithOne()
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
