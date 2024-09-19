using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.AccountAggregate
{
    public class AccountModelBuilder : IEntityTypeConfiguration<Account>
    {
        public void Configure(EntityTypeBuilder<Account> builder)
        {
            builder.OwnsOne(x => x.EmailConfirmationToken);
            builder.OwnsOne(x => x.ResetPasswordToken);
            builder
                .HasOne(x => x.AppUser)
                .WithOne(x => x.Account)
                .HasForeignKey<AppUser>(x => x.Id);
        }
    }
}
