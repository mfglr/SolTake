﻿namespace SolTake.Domain.MessageUserRemoveAggregate.Abstracts
{
    public interface IMessageUserRemoveReadRepository
    {
        Task<List<int>> GetUserIdsRemovedAsync(int messageId, CancellationToken cancellationToken);
        Task<bool> IsDeletedAllUsersAsync(int messageId, CancellationToken cancellationToken);
        Task<bool> ExistAsync(int messageId, int userId, CancellationToken cancellationToken);
    }
}
