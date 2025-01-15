using AccountDomain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

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
