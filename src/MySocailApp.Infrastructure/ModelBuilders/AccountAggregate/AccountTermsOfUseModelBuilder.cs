using AccountDomain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MySocailApp.Infrastructure.ModelBuilders.AccountAggregate
{
    public class AccountTermsOfUseModelBuilder : IEntityTypeConfiguration<AccountTermsOfUse>
    {
        public void Configure(EntityTypeBuilder<AccountTermsOfUse> builder)
        {
            builder.HasKey(x => new {x.AccountId,x.TermsOfUseId});
        }
    }
}
