using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.SolutionAggregate
{
    public class SolutionUserVoteModelBuilder : IEntityTypeConfiguration<SolutionUserVote>
    {
        public void Configure(EntityTypeBuilder<SolutionUserVote> builder)
        {
            builder.HasIndex(x => new { x.UserId, x.Type });
        }
    }
}
