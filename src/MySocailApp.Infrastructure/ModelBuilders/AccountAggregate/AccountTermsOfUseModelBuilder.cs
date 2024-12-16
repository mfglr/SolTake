using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;

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
