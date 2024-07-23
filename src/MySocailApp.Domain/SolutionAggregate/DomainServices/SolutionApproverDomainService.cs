using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Repositories;

namespace MySocailApp.Domain.SolutionAggregate.DomainServices
{
    public class SolutionApproverDomainService(IQuestionRepositorySA questionRepository)
    {
        private readonly IQuestionRepositorySA _questionRepository = questionRepository;

        public async Task MarkAsApproved(Solution solution,int approverId,CancellationToken cancellationToken)
        {
            var question = 
                await _questionRepository.GetByIdAsync(solution.QuestionId, cancellationToken) ?? 
                throw new QuestionIsNotFoundException();

            if (question.AppUserId != approverId)
                throw new UnathorizedApproval();

            solution.MarkAsApproved();
        }

        public async Task MarkAsPending(Solution solution,int approverId,CancellationToken cancellationToken)
        {
            var question =
                await _questionRepository.GetByIdAsync(solution.QuestionId, cancellationToken) ??
                throw new QuestionIsNotFoundException();

            if (question.AppUserId != approverId)
                throw new UnathorizedApproval();

            solution.MarkAsPending();
        }
    }
}
