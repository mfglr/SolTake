using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.MessageAggregate
{
    public class MessageUserRemoveModelBuillder : IEntityTypeConfiguration<MessageUserRemove>
    {
        public void Configure(EntityTypeBuilder<MessageUserRemove> builder)
        {
            builder.HasKey(x => new {x.MessageId,x.UserId});
        }
    }
}
