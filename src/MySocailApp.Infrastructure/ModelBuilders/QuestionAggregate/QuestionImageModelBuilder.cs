using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionAggregate
{
    public class QuestionImageModelBuilder : IEntityTypeConfiguration<QuestionImage>
    {
        public void Configure(EntityTypeBuilder<QuestionImage> builder)
        {
            builder.OwnsOne(x => x.Dimention);
        }
    }
}
