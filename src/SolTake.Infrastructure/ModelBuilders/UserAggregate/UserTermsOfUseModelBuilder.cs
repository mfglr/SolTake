using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.UserAggregate
{
    public class UserTermsOfUseModelBuilder : IEntityTypeConfiguration<UserTermsOfUse>
    {
        public void Configure(EntityTypeBuilder<UserTermsOfUse> builder)
        {
            builder.HasKey(x => new { x.UserId, x.TermsOfUseId });
        }
    }
}
