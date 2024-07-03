namespace MySocailApp.Domain.AppUserAggregate
{
    public interface IAppUserReadRepository
    {
        Task<AppUser?> GetByIdAsync(string id,CancellationToken cancellationToken);
        Task<List<AppUser>> GetFollowersById(string id, CancellationToken cancellationToken, string lastId = "");
        Task<List<AppUser>> GetFollowedsById(string id, CancellationToken cancellationToken, string lastId = "");
    }
}
