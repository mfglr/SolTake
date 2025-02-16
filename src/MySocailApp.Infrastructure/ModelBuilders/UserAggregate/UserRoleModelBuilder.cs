using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.UserAggregate
{
    public class UserRoleModelBuilder : IEntityTypeConfiguration<UserRole>
    {
        public void Configure(EntityTypeBuilder<UserRole> builder)
        {
            builder.HasKey(x => new { x.UserId, x.RoleId });
        }
    }
}
