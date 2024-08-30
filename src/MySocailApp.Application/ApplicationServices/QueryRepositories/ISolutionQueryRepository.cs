using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.ApplicationServices.QueryRepositories
{
    public interface ISolutionQueryRepository
    {
        Task<SolutionResponseDto?> GetByIdAsync(int accountId, int solutionId, CancellationToken cancellationToken);
        Task<List<SolutionResponseDto>> GetSolutionsByQuestionIdAsync(int accountId, IPage page, int questionId, CancellationToken cancellationToken);
        Task<List<SolutionResponseDto>> GetCorrectSolutionsByQuestionId(int accountId, IPage page, int questionId, CancellationToken cancellationToken);
        Task<List<SolutionResponseDto>> GetPendingSolutionsByQuestionId(int accountId, IPage pagination, int questionId, CancellationToken cancellationToken);
        Task<List<SolutionResponseDto>> GetIncorrectSolutionsByQuestionId(int accountId, IPage pagination, int questionId, CancellationToken cancellationToken);
    }
}
