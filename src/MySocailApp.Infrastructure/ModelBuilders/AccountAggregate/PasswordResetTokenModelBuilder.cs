using AccountDomain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MySocailApp.Infrastructure.ModelBuilders.AccountAggregate
{
    public class PasswordResetTokenModelBuilder : IEntityTypeConfiguration<PasswordResetToken>
    {
        public void Configure(EntityTypeBuilder<PasswordResetToken> builder)
        {
            builder.Ignore(x => x.Value);
        }
    }
}
