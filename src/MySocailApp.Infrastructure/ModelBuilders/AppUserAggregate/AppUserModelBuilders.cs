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
                .HasMany(x => x.Followers)
                .WithOne()
                .HasForeignKey(x => x.FollowedId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Followeds)
                .WithOne()
                .HasForeignKey(x => x.FollowerId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.QuestionsLiked)
                .WithOne()
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.CommentsLiked)
                .WithOne()
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.CommentsTagged)
                .WithOne()
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Searcheds)
                .WithOne()
                .HasForeignKey(x => x.SearcherId);

            builder
                .HasMany(x => x.Searchers)
                .WithOne()
                .HasForeignKey(x => x.SearchedId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Votes)
                .WithOne()
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

        }
    }
}
