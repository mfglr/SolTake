using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ConversationContext.ConversationAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.ConversationContext
{
    public class ConversationModelBuilder : IEntityTypeConfiguration<Conversation>
    {
        public void Configure(EntityTypeBuilder<Conversation> builder)
        {
            builder.HasKey(x => new {x.UserId1,x.UserId2});
        }
    }
}
