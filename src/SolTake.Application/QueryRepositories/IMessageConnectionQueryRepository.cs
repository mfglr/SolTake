using MySocailApp.Application.Queries.MessageDomain;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IMessageConnectionQueryRepository
    {
        Task<MessageConnectionResponseDto?> GetById(int id,CancellationToken cancellationToken);
    }
}
