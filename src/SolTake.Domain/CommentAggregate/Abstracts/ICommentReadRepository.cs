﻿using SolTake.Domain.CommentAggregate.Entities;

namespace SolTake.Domain.CommentAggregate.Abstracts
{
    public interface ICommentReadRepository
    {
        Task<Comment?> GetAsync(int id, CancellationToken cancellationToken);
        Task<bool> Exist(int id, CancellationToken cancellationToken);
        Task<int?> GetParentId(int id, CancellationToken cancellationToken);

        Task<List<int>> GetCommentIdsOfUser(int userId, CancellationToken cancellationToken);
    }
}
