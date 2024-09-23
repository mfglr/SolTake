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
            builder.OwnsOne(x => x.EmailConfirmationToken,opt => opt.Ignore(x => x.Token));
            builder
                .HasOne(x => x.AppUser)
                .WithOne(x => x.Account)
                .HasForeignKey<AppUser>(x => x.Id)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
