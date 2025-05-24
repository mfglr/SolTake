using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.UserAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.UserAggregate
{
    public class UserPrivacyPolicyModelBuilder : IEntityTypeConfiguration<UserPrivacyPolicy>
    {
        public void Configure(EntityTypeBuilder<UserPrivacyPolicy> builder)
        {
            builder.HasKey(x => new { x.UserId, x.PravicyPolicyId });
        }
    }
}
