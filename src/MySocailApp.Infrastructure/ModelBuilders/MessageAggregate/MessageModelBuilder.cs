using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.MessageAggregate
{
    public class MessageModelBuilder : IEntityTypeConfiguration<Message>
    {
        public void Configure(EntityTypeBuilder<Message> builder)
        {
            builder.OwnsOne(
                x => x.Content,
                sa =>
                {
                    sa.Property(p => p.Value).HasColumnName("Content");
                }
            );

            builder
                .HasMany(x => x.Images)
                .WithOne()
                .HasForeignKey(x => x.MessageId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Receivers)
                .WithOne()
                .HasForeignKey(x => x.MessageId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Viewers)
                .WithOne()
                .HasForeignKey(x => x.MessageId)
                .OnDelete(DeleteBehavior.Cascade);

            builder
                .HasMany(x => x.Removers)
                .WithOne()
                .HasForeignKey(x => x.MessageId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
