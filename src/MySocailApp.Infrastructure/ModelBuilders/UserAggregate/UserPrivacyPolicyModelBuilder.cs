using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.UserAggregate
{
    public class UserPrivacyPolicyModelBuilder : IEntityTypeConfiguration<UserPrivacyPolicy>
    {
        public void Configure(EntityTypeBuilder<UserPrivacyPolicy> builder)
        {
            builder.HasKey(x => new { x.UserId, x.PravicyPolicyId });
        }
    }
}
