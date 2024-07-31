using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.AppUserAggregate
{
    public class UserModelBuilder : IEntityTypeConfiguration<AppUser>
    {
        public void Configure(EntityTypeBuilder<AppUser> builder)
        {

            builder.Property(e => e.Id).ValueGeneratedNever();

            builder.OwnsOne(x => x.Image);

            builder
                .HasOne(x => x.UserConnection)
                .WithOne(x => x.AppUser)
                .HasForeignKey<UserConnection>(x => x.Id);

            builder
                .HasMany(x => x.Followers)
                .WithOne(x => x.Followed)
                .HasForeignKey(x => x.FollowedId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Followeds)
                .WithOne(x => x.Follower)
                .HasForeignKey(x => x.FollowerId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Requesters)
                .WithOne(x => x.Requested)
                .HasForeignKey(x => x.RequestedId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Requesteds)
                .WithOne(x => x.Requester)
                .HasForeignKey(x => x.RequesterId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Blockers)
                .WithOne(x => x.Blocked)
                .HasForeignKey(x => x.BlockedId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Blockeds)
                .WithOne(x => x.Blocker)
                .HasForeignKey(x => x.BlockerId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Questions)
                .WithOne(x => x.AppUser)
                .HasForeignKey(x => x.AppUserId);

            builder
                .HasMany(x => x.QuestionsLiked)
                .WithOne(x => x.AppUser)
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Solutions)
                .WithOne(x => x.AppUser)
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Comments)
                .WithOne(x => x.AppUser)
                .HasForeignKey (x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.CommentsLiked)
                .WithOne(x => x.AppUser)
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.CommentsTagged)
                .WithOne(x => x.AppUser)
                .HasForeignKey(x => x.AppUserId)
                .OnDelete(DeleteBehavior.NoAction);

            builder
                .HasMany(x => x.Noitifications)
                .WithOne(x => x.Owner)
                .HasForeignKey(x => x.OwnerId);
        }
    }
}
