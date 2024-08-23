using MediatR;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionDeleterDomainService(ISolutionWriteRepository solutionWriteRepository, IQuestionWriteRepository questionWriteRepository, ISolutionReadRepository solutionReadRepository)
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;

        public async Task DeleteAsync(Solution solution, CancellationToken cancellationToken)
        {
            var numberOfCorrectSolution = await _solutionReadRepository.GetNumberOfQuestionCorrectSolutionsAsync(solution.QuestionId, cancellationToken);

            var question =
                await _questionWriteRepository.GetByIdAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            question.AddDomainEvent(new SolutionDeletedDomainEvent(solution.Id));

            if (numberOfCorrectSolution == 1)
                question.AddDomainEvent(new LastCorrectSolutionDeletedDomainEvent(question));
            
            solution.Delete();
            _solutionWriteRepository.Delete(solution);
        }
    }
}
