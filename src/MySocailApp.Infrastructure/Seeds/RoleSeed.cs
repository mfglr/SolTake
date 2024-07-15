using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MySocailApp.Infrastructure.Seeds
{
    public class RoleSeed : IEntityTypeConfiguration<IdentityRole<int>>
    {
        public void Configure(EntityTypeBuilder<IdentityRole<int>> builder)
        {
            builder.HasData(
                new { Id = 1, Name = "user", NormalizedName = "USER" },
                new { Id = 2, Name = "admin", NormalizedName = "ADMIN" }
            );
        }
    }
}
