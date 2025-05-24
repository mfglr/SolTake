using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.UserAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.UserAggregate
{
    public class UserTermsOfUseModelBuilder : IEntityTypeConfiguration<UserTermsOfUse>
    {
        public void Configure(EntityTypeBuilder<UserTermsOfUse> builder)
        {
            builder.HasKey(x => new { x.UserId, x.TermsOfUseId });
        }
    }
}
