using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class IQuestionBlobNameGenerator : IQuestionImageBlobNameGenerator
    {
        public IQuestionBlobNameGenerator()
        {
        }

        public string Generate() => $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
    }
}
