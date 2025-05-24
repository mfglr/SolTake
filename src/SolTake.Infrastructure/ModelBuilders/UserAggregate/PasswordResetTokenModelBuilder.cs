using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.UserAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.UserAggregate
{
    public class PasswordResetTokenModelBuilder : IEntityTypeConfiguration<PasswordResetToken>
    {
        public void Configure(EntityTypeBuilder<PasswordResetToken> builder)
        {
            builder.Ignore(x => x.Value);
        }
    }
}
