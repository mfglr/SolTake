using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.SolutionAggregate
{
    public class SolutionUserVoteModelBuilder : IEntityTypeConfiguration<SolutionUserVote>
    {
        public void Configure(EntityTypeBuilder<SolutionUserVote> builder)
        {
            builder.HasKey(x => new {x.SolutionId,x.AppUserId});
        }
    }
}
