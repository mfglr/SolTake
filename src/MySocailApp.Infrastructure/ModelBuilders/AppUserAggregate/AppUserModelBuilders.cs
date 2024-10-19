using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.AppUserAggregate
{
    public class UserModelBuilder : IEntityTypeConfiguration<AppUser>
    {
        public void Configure(EntityTypeBuilder<AppUser> builder)
        {
            builder.Property(e => e.Id).ValueGeneratedNever();
            builder.OwnsOne(x => x.Image);
            builder.OwnsOne(x => x.Biography);
          
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
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
