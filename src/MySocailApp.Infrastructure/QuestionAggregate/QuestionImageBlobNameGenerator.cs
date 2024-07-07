using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionImageBlobNameGenerator : IQuestionImageBlobNameGenerator
    {
        public string Generate() => $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
    }
}
