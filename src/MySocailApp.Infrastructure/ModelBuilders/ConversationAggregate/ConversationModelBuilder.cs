using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ConversationAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.ConversationAggregate
{
    public class ConversationModelBuilder : IEntityTypeConfiguration<Conversation>
    {
        public void Configure(EntityTypeBuilder<Conversation> builder)
        {
            builder
                .HasMany(x => x.Messages)
                .WithOne(x => x.Conversation)
                .HasForeignKey(x => x.ConversationId);

            builder
                .HasMany(x => x.Users)
                .WithOne(x => x.Conversation)
                .HasForeignKey(x => x.ConversationId);
        }
    }
}
