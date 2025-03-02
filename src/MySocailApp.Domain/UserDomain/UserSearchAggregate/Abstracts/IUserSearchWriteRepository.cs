using MySocailApp.Domain.UserDomain.UserSearchAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.UserSearchAggregate.Abstracts
{
    public interface IUserSearchWriteRepository
    {
        Task<UserSearch?> GetAsync(int searcherId, int searchedId, CancellationToken cancellationToken);
        Task<List<UserSearch>> GetUserSearchsByUserId(int userId,CancellationToken cancellationToken);
        Task CreateAsync(UserSearch userSearch,CancellationToken cancellationToken);
        void Delete(UserSearch userSearch);
        void DeleteRange(IEnumerable<UserSearch> userSearchs);
    }
}
