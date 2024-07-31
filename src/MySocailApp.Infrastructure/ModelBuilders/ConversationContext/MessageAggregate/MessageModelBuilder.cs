using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.ConversationContext.MessageAggregate
{
    public class MessageModelBuilder : IEntityTypeConfiguration<Message>
    {
        public void Configure(EntityTypeBuilder<Message> builder)
        {
            builder.Property(x => x.RowVersion).IsRowVersion();

            builder
                .HasMany(x => x.Images)
                .WithOne(x => x.Message)
                .HasForeignKey(x => x.MessageId);
        }
    }
}
