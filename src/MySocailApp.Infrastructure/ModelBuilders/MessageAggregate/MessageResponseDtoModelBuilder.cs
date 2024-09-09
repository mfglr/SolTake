using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Application.Queries.MessageAggregate;

namespace MySocailApp.Infrastructure.ModelBuilders.MessageAggregate
{
    public class MessageResponseDtoModelBuilder : IEntityTypeConfiguration<MessageResponseDto>
    {
        public void Configure(EntityTypeBuilder<MessageResponseDto> builder)
        {
            builder.HasNoKey();
        }
    }
}
