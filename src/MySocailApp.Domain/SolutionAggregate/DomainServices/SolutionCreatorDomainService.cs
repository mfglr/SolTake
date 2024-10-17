using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionCreatorDomainService(IQuestionReadRepository questionRepository)
    {
        private readonly IQuestionReadRepository _questionRepository = questionRepository;

        public async Task CreateAsync(Solution solution, CancellationToken cancellationToken)
        {
            var question =
                await _questionRepository.GetAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (question.AppUserId == solution.AppUserId)
                throw new PermessionDeniedToSolveYourQuestionException();

            solution.Create();

            solution.AddDomainEvent(new SolutionCreatedDomainEvent(question,solution));
        }
    }
}
