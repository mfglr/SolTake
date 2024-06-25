namespace MySocailApp.Domain.AppNotificationAggregate
{
    public interface IAppNotificationRepository
    {
        Task CreateAsync(AppNotification notification,CancellationToken cancellationToken);
        Task CreateListAsync(IEnumerable<AppNotification> notifications,CancellationToken cancellationToken);
    }
}
