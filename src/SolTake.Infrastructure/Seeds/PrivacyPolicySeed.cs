using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.PrivacyPolicyAggregate;

namespace MySocailApp.Infrastructure.Seeds
{
    public class PrivacyPolicySeed : IEntityTypeConfiguration<PrivacyPolicy>
    {
        public void Configure(EntityTypeBuilder<PrivacyPolicy> builder)
        {
            builder
                .HasData(
                    new
                    {
                        Id = 1,
                        CreatedAt = new DateTime(2024, 10, 7, 18, 59, 45),
                        AdminId = 1,
                        BlobNameTr = "privacy_policy_version1_tr.html",
                        BlobNameEn = "privacy_policy_version1_en.html",
                    }
                );
        }
    }
}
