using MySocailApp.Application.Queries.QuestionDomain;
using SolTake.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IQuestionUserSaveQueryRepository
    {
        Task<List<QuestionUserSaveResponseDto>> GetAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
