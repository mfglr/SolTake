using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.ConversationContext.MessageAggregate
{
    public class MessageUserViewsModelBuilder : IEntityTypeConfiguration<MessageUserViews>
    {
        public void Configure(EntityTypeBuilder<MessageUserViews> builder)
        {
            builder.HasKey(x => new { x.MessageId, x.AppUserId });
        }
    }
}
