using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.ConversationAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.ConversationAggregate
{
    public class ConversationUserModelBuilder : IEntityTypeConfiguration<ConversationUser>
    {
        public void Configure(EntityTypeBuilder<ConversationUser> builder)
        {
            builder.HasKey(x => new { x.ConversationId, x.AppUserId });
        }
    }
}
