using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainServices
{
    public class SolutionStateMarkerDomainService(IQuestionReadRepository questionReadRepository)
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;

        public async Task MarkAsCorrectAsync(Solution solution, Login login, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            solution.MarkAsCorrect(question,login);
        }

        public async Task MarkAsIncorrectAsync(Solution solution, Login login, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            solution.MarkAsIncorrect(question,login);
        }
    }
}
