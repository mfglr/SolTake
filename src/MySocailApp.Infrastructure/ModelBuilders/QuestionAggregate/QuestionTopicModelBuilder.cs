using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MySocailApp.Domain.QuestionAggregate;

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
