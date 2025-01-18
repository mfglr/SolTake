using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.SolutionAggregate
{
    public class SolutionVoteNotificationModelBuilder : IEntityTypeConfiguration<SolutionUserVoteNotification>
    {
        public void Configure(EntityTypeBuilder<SolutionUserVoteNotification> builder)
        {
            builder.HasKey(x => new { x.SolutionId, x.UserId } );
        }
    }
}
