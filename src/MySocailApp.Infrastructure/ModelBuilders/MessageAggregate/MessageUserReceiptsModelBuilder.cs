using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.MessageAggregate
{
    public class MessageUserReceiptsModelBuilder : IEntityTypeConfiguration<MessageUserReceive>
    {
        public void Configure(EntityTypeBuilder<MessageUserReceive> builder)
        {
            builder.HasKey(x => new { x.MessageId, x.AppUserId });
        }
    }
}
