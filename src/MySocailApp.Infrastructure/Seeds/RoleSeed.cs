using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.AccountDomain.RoleAggregate.Entities;

namespace MySocailApp.Infrastructure.Seeds
{
    public class RoleSeed : IEntityTypeConfiguration<Role>
    {
        public void Configure(EntityTypeBuilder<Role> builder)
        {
            builder.HasData(
                new { Id = 1, Name = "user" },
                new { Id = 2, Name = "admin" }
            );
        }
    }
}
