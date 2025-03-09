using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Entities;

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
