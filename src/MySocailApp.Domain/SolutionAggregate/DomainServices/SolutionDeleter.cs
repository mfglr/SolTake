using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionDeleter(IQuestionWriteRepository questionWriteRepository, ISolutionReadRepository solutionReadRepository, ISolutionWriteRepository solutionWriteRepository)
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;

        public async Task DeleteAsync(Solution solution, int removerId, CancellationToken cancellationToken)
        {
            if (solution.AppUserId != removerId)
                throw new PermissionDeniedToRemoveSolutionException();

            if (solution.State == SolutionState.Correct)
            {
                var question =
                    await _questionWriteRepository.GetByIdAsync(solution.QuestionId, cancellationToken) ??
                    throw new QuestionNotFoundException();
                var count = await _solutionReadRepository.GetCountOfCorrectSolutionsByQuestionIdAsync(solution.QuestionId, cancellationToken);

                if (count <= 1)
                {
                    question.MarkAsPending();
                    question.AddDomainEvent(new LastCorrectSolutionDeletedDomainEvent());
                }

                solution.Delete();

            }

        }
    }
}
