using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.AppUserAggregate
{
    public class UserFollowNotificationModelBuilder : IEntityTypeConfiguration<UserFollowNotification>
    {
        public void Configure(EntityTypeBuilder<UserFollowNotification> builder)
        {
            builder.HasKey(x => new { x.UserId, x.FollowerId });
        }
    }
}
