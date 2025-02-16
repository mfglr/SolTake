using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.UserAggregate
{
    public class UserModelBuilder : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Ignore(x => x.AccessToken);
            builder.Ignore(x => x.RefreshToken);

            builder.OwnsOne(x => x.Image);
            builder.OwnsOne(x => x.Language);
            builder.OwnsOne(x => x.Biography);
            builder.OwnsOne(x => x.Password, password => password.Ignore(x => x.Value));
            builder.OwnsOne(x => x.Email, email => email.HasIndex(x => x.Value).IsUnique());
            builder.OwnsOne(x => x.UserName, userName => userName.HasIndex(x => x.Value).IsUnique());
            builder.OwnsOne(
                x => x.GoogleAccount,
                googleAccount =>
                {
                    googleAccount.HasIndex(x => x.GoogleId);
                    googleAccount.Ignore(x => x.Email);
                }
            );

            builder
                .HasMany(x => x.PrivacyPolicies)
                .WithOne()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.TermsOfUses)
                .WithOne()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.VerificationTokens)
                .WithOne()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Roles)
                .WithOne()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);


            builder
                .HasMany(x => x.Blockers)
                .WithOne()
                .HasForeignKey(x => x.BlockedId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Searchers)
                .WithOne()
                .HasForeignKey(x => x.SearchedId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Followers)
                .WithOne()
                .HasForeignKey(x => x.FollowedId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.UserFollowNotifications)
                .WithOne()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
