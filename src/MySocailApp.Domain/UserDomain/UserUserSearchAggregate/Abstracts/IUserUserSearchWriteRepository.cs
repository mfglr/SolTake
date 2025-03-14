﻿using MySocailApp.Domain.UserDomain.UserUserSearchAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.UserUserSearchAggregate.Abstracts
{
    public interface IUserUserSearchWriteRepository
    {
        Task<UserUserSearch?> GetAsync(int searcherId, int searchedId, CancellationToken cancellationToken);
        Task<List<UserUserSearch>> GetUserSearchsByUserId(int userId, CancellationToken cancellationToken);
        Task CreateAsync(UserUserSearch userSearch, CancellationToken cancellationToken);
        void Delete(UserUserSearch userSearch);
        void DeleteRange(IEnumerable<UserUserSearch> userSearchs);
    }
}
