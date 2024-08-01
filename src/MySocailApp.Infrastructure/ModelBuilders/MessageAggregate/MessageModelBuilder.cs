using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.MessageAggregate
{
    public class MessageModelBuilder : IEntityTypeConfiguration<Message>
    {
        public void Configure(EntityTypeBuilder<Message> builder)
        {
            builder
                .HasMany(x => x.Images)
                .WithOne(x => x.Message)
                .HasForeignKey(x => x.MessageId);

            builder
                .HasMany(x => x.Receivers)
                .WithOne(x => x.Message)
                .HasForeignKey(x => x.MessageId);

            builder
                .HasMany(x => x.Viewers)
                .WithOne(x => x.Message)
                .HasForeignKey(x => x.MessageId);
        }
    }
}
