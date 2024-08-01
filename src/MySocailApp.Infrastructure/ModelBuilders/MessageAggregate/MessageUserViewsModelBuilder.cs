using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.MessageAggregate
{
    public class MessageUserViewsModelBuilder : IEntityTypeConfiguration<MessageUserView>
    {
        public void Configure(EntityTypeBuilder<MessageUserView> builder)
        {
            builder.HasKey(x => new { x.MessageId, x.AppUserId });
        }
    }
}
