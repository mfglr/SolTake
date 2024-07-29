using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.AppUserAggregate
{
    public class FollowRequestModelBuilders : IEntityTypeConfiguration<FollowRequest>
    {
        public void Configure(EntityTypeBuilder<FollowRequest> builder)
        {
            builder.HasKey(x => new { x.RequesterId, x.RequestedId });
        }
    }
}
