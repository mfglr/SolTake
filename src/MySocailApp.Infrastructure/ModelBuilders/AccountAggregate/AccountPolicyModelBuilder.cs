using AccountDomain.AccountAggregate.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MySocailApp.Infrastructure.ModelBuilders.AccountAggregate
{
    public class AccountPolicyModelBuilder : IEntityTypeConfiguration<AccountPrivacyPolicy>
    {
        public void Configure(EntityTypeBuilder<AccountPrivacyPolicy> builder)
        {
            builder.HasKey(x => new { x.AccountId, x.PolicyId });
        }
    }
}
