using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.AccountAggregate
{
    public class VerificationTokenModelBuilder : IEntityTypeConfiguration<EmailVerificationToken>
    {
        public void Configure(EntityTypeBuilder<EmailVerificationToken> builder)
        {
            builder.Ignore(x => x.Value);
        }
    }
}
