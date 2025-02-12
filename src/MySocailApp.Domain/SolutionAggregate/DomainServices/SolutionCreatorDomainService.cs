using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Entities;

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

            if(question.UserId != solution.UserId)
                solution.AddDomainEvent(new SolutionCreatedDomainEvent(question, solution));
            else
                solution.MarkAsCorrect();
        }
    }
}
