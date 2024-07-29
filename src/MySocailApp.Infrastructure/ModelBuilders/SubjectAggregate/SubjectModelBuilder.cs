using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.SubjectAggregate
{
    public class SubjectModelBuilder : IEntityTypeConfiguration<Subject>
    {
        public void Configure(EntityTypeBuilder<Subject> builder)
        {
            builder
                .HasMany(x => x.Topics)
                .WithOne(x => x.Subject)
                .HasForeignKey(x => x.SubjectId);

            builder
                .HasMany(x => x.Quesitons)
                .WithOne(x => x.Subject)
                .HasForeignKey(x => x.SubjectId)
                .OnDelete(DeleteBehavior.NoAction);
        }
    }
}
