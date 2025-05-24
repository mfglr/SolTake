using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.TermsOfUseAggregate;

namespace SolTake.Infrastructure.Seeds
{
    public class TermsOfUseSeed : IEntityTypeConfiguration<TermsOfUse>
    {
        public void Configure(EntityTypeBuilder<TermsOfUse> builder)
        {
            builder
                .HasData(
                    new
                    {
                        Id = 1,
                        CreatedAt = new DateTime(2024, 10, 7, 18, 59, 45),
                        AdminId = 1,
                        BlobNameTr = "terms_of_use_tr",
                        BlobNameEn = "terms_of_use_en",
                    }
                );
        }
    }
}
