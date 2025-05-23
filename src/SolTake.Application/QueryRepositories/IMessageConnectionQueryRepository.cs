using SolTake.Application.Queries.MessageDomain;

namespace SolTake.Application.QueryRepositories
{
    public interface IMessageConnectionQueryRepository
    {
        Task<MessageConnectionResponseDto?> GetById(int id,CancellationToken cancellationToken);
    }
}
