using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;

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
