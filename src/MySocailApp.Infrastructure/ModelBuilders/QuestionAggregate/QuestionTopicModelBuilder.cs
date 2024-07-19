using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Infrastructure.ModelBuilders.QuestionAggregate
{
    public class QuestionTopicModelBuilder : IEntityTypeConfiguration<QuestionTopic>
    {
        public void Configure(EntityTypeBuilder<QuestionTopic> builder)
        {
            builder.HasKey(x => new {x.QuestionId,x.TopicId});
        }
    }
}
