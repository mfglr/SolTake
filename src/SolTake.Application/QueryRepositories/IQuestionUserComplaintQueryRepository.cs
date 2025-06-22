using SolTake.Application.Queries.QuestionUserComplaintAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IQuestionUserComplaintQueryRepository
    {
        Task<List<QuestionUserComplaintResponseDto>> GetUnviewedQuestionUserComplaintsAsync(IPage page, CancellationToken cancellationToken);
    }
}
