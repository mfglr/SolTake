namespace MySocailApp.Domain.AppNotificationClientAggregate
{
    public interface IAppNotificationClientRepository
    {
        Task CreateAsync(AppNotificationClient client,CancellationToken cancellationToken);
        Task<AppNotificationClient?> GetByIdAsync(string id,CancellationToken cancellationToken);
    }
}
