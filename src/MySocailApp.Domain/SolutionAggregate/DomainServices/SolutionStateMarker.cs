using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionStateMarker(IQuestionWriteRepository questionWriteRepository, IQuestionReadRepository questionReadRepository)
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;

        public async Task MarkAsCorrectAsync(Solution solution, int markerId, CancellationToken cancellationToken)
        {
            var question =
                await _questionWriteRepository.GetByIdAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (markerId != question.AppUserId)
                throw new PermissionDeniedToChangeStateOfSolution();

            solution.MarkAsCorrect();

            if(question.State != QuestionState.Solved)
            {
                question.AddDomainEvent(new QuestionSolvedDomainEvent(question, solution));
                question.MarkAsSolved();
            }
        }

        public async Task MarkAsIncorrectAsync(Solution solution, int markerId, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (markerId != question.AppUserId)
                throw new PermissionDeniedToChangeStateOfSolution();

            solution.MarkAsIncorrect();
        }
    }
}
