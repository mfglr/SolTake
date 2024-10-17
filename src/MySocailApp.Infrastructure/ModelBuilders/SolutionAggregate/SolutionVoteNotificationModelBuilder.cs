using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.SolutionAggregate
{
    public class SolutionVoteNotificationModelBuilder : IEntityTypeConfiguration<SolutionVoteNotification>
    {
        public void Configure(EntityTypeBuilder<SolutionVoteNotification> builder)
        {
            builder.HasKey(x => new { x.SolutionId, x.AppUserId } );
        }
    }
}
