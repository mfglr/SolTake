using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Repositories;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionCreatorDomainService(IQuestionRepositorySA questionRepository)
    {
        private readonly IQuestionRepositorySA _questionRepository = questionRepository;

        public async Task CreateAsync(Solution solution,int userId,int questionId,string? content,IEnumerable<SolutionImage> images,CancellationToken cancellationToken)
        {
            var question = 
                await _questionRepository.GetByIdAsync(questionId, cancellationToken) ??
                throw new QuestionIsNotFoundException();

            if (question.AppUserId == userId)
                throw new UnableToSolveYourQuestionException();

            solution.Create(question.Id, userId, content, images);
        }
    }
}
