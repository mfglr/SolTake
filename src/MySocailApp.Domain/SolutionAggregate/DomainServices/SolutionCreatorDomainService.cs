using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionCreatorDomainService(IQuestionReadRepository questionRepository, ISolutionWriteRepository solutionWriteRepository)
    {
        private readonly IQuestionReadRepository _questionRepository = questionRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;

        public async Task CreateAsync(Solution solution, int userId, int questionId, CancellationToken cancellationToken)
        {
            var question =
                await _questionRepository.GetAsync(questionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (question.AppUserId == userId)
                throw new UnableToSolveYourQuestionException();

            solution.Create(questionId, userId);
            await _solutionWriteRepository.CreateAsync(solution,cancellationToken);
        }
    }
}
