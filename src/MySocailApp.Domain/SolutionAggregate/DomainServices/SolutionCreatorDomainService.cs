using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionCreatorDomainService(IQuestionReadRepository questionRepository)
    {
        private readonly IQuestionReadRepository _questionRepository = questionRepository;

        public async Task CreateAsync(Solution solution,int userId,int questionId,string? content,IEnumerable<SolutionImage> images,CancellationToken cancellationToken)
        {
            var question = 
                await _questionRepository.GetAsync(questionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (question.AppUserId == userId)
                throw new UnableToSolveYourQuestionException();

            solution.Create(questionId, userId, content, images);
        }
    }
}
