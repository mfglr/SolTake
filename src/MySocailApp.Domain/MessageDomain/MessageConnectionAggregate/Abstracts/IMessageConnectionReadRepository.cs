﻿using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts
{
    public interface IMessageConnectionReadRepository
    {
        Task<MessageConnection?> GetById(int id, CancellationToken cancellationToken);
        Task<List<MessageConnection>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken);
        Task<List<string>> GetConnectionIdsByConnection(MessageConnection connection, CancellationToken cancellationToken);
    }
}
