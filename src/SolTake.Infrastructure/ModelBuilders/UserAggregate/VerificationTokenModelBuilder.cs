using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.UserAggregate
{
    public class VerificationTokenModelBuilder : IEntityTypeConfiguration<EmailVerificationToken>
    {
        public void Configure(EntityTypeBuilder<EmailVerificationToken> builder)
        {
            builder.Ignore(x => x.Value);
        }
    }
}
