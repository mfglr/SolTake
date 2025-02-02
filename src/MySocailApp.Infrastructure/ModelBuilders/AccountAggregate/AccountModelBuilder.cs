using AccountDomain.AccountAggregate.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MySocailApp.Infrastructure.ModelBuilders.AccountAggregate
{
    public class AccountModelBuilder : IEntityTypeConfiguration<Account>
    {
        public void Configure(EntityTypeBuilder<Account> builder)
        {

            builder.OwnsOne(x => x.Password,password => password.Ignore(x => x.Value));
            builder.OwnsOne(
                x => x.UserName,
                userName => {
                    userName.HasIndex(x => x.Value).IsUnique();
                    userName.Property(x => x.Value).HasColumnName("UserName_Value");
                }
            );
            builder.OwnsOne(
                x => x.Email,
                email => {
                    email.HasIndex(x => x.Value);
                    email.Property(x => x.Value).HasColumnName("Email_Value");
                }
            );
            builder.OwnsOne(
                x => x.Language,
                language =>
                {
                    language.Property(x => x.Value).HasColumnName("Language_Value");
                }
            );
            builder.OwnsOne(
                x => x.GoogleAccount,
                googleAccount => {
                    googleAccount.HasIndex(x => x.UserId);
                    googleAccount.Ignore(x => x.Email);
                }
            );


            builder
                .HasMany(x => x.Blockers)
                .WithOne()
                .HasForeignKey(x => x.BlockedId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.PrivacyPolicies)
                .WithOne()
                .HasForeignKey(x => x.AccountId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.TermsOfUses)
                .WithOne()
                .HasForeignKey(x => x.AccountId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.VerificationTokens)
                .WithOne()
                .HasForeignKey(x => x.AccountId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
