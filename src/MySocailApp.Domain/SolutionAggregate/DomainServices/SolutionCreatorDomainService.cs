using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.UserUserBlockAggregate.Abstracts;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionCreatorDomainService(IQuestionReadRepository questionReadRepository, IUserUserBlockRepository userUserBlockRepository)
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;

        public async Task CreateAsync(Solution solution, Login login, CancellationToken cancellationToken)
        {
            var question =
                await _questionReadRepository.GetAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(question.UserId, solution.UserId, cancellationToken))
                throw new QuestionNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(solution.UserId, question.UserId, cancellationToken))
                throw new UserBlockedException();

            solution.Create();
            solution.AddDomainEvent(new SolutionCreatedDomainEvent(question, solution, login));
        }
    }
}
