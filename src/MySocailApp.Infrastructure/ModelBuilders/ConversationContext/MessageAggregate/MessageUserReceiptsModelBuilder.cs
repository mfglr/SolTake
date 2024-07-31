using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.ConversationContext.MessageAggregate
{
    public class MessageUserReceiptsModelBuilder : IEntityTypeConfiguration<MessageUserReceipts>
    {
        public void Configure(EntityTypeBuilder<MessageUserReceipts> builder)
        {
            builder.HasKey(x => new { x.MessageId, x.AppUserId });
        }
    }
}
