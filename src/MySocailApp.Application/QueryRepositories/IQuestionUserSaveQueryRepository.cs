using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IQuestionUserSaveQueryRepository
    {
        Task<List<QuestionUserSaveResponseDto>> GetSavesAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
