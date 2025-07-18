﻿using SolTake.Domain.UserUserSearchAggregate.Entities;

namespace SolTake.Domain.UserUserSearchAggregate.Abstracts
{
    public interface IUserUserSearchWriteRepository
    {
        Task<UserUserSearch?> GetAsync(int searcherId, int searchedId, CancellationToken cancellationToken);
        Task<List<UserUserSearch>> GetUserSearchsByUserId(int userId, CancellationToken cancellationToken);
        Task CreateAsync(UserUserSearch userSearch, CancellationToken cancellationToken);
        void Delete(UserUserSearch userSearch);
        void DeleteRange(IEnumerable<UserUserSearch> userSearchs);

        Task<List<UserUserSearch>> GetByUserIds(int userId0, int userId1, CancellationToken cancellationToken);
    }
}
