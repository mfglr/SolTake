using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SolTake.Domain.QuestionUserComplaintAggregate.Entities;

namespace SolTake.Infrastructure.ModelBuilders.QuestionUserComplaintAggregate
{
    internal class QuestionUserComplaintModelBuilders : IEntityTypeConfiguration<QuestionUserComplaint>
    {
        public void Configure(EntityTypeBuilder<QuestionUserComplaint> builder)
        {
            builder.OwnsOne(x => x.Content);
        }
    }
}
