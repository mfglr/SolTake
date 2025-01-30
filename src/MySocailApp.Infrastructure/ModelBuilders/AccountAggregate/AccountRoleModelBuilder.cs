using AccountDomain.AccountAggregate.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MySocailApp.Infrastructure.ModelBuilders.AccountAggregate
{
    public class AccountRoleModelBuilder : IEntityTypeConfiguration<AccountRole>
    {
        public void Configure(EntityTypeBuilder<AccountRole> builder)
        {
            builder.HasKey(x => new { x.AccountId, x.RoleId });
        }
    }
}
