using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IQuestionUserSaveQueryRepository
    {
        Task<List<QuestionUserSaveResponseDto>> GetAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
