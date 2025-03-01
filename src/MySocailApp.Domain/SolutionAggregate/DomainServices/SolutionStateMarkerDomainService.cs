using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionStateMarkerDomainService(IQuestionReadRepository questionReadRepository)
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;

        public async Task MarkAsCorrectAsync(Solution solution, int markerId, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (markerId != question.UserId)
                throw new PermissionDeniedToChangeStateOfSolution();

            solution.MarkAsCorrect();
            solution.AddDomainEvent(new SolutionMarkedAsCorrectDomainEvent(question,solution));
        }

        public async Task MarkAsIncorrectAsync(Solution solution, int markerId, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (markerId != question.UserId)
                throw new PermissionDeniedToChangeStateOfSolution();

            solution.MarkAsIncorrect();
            solution.AddDomainEvent(new SolutionMarkedAsIncorrectDomainEvent(question, solution));
        }
    }
}
