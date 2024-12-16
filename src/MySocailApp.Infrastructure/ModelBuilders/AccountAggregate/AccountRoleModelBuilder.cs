using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;

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
