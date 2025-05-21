using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.Commands.NotificationDomain.NotificationAggregate.MarkAsViewedNotifications
{
    public class MarkAsViewedNotificationsHandler(INotificationWriteRepository repository, IUnitOfWork unitOfWork) : IRequestHandler<MarkAsViewedNotificationsDto>
    {
        private readonly INotificationWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MarkAsViewedNotificationsDto request, CancellationToken cancellationToken)
        {
            var notifications = await _repository.GetByIds(request.Ids, cancellationToken);
            foreach (var notification in notifications)
                notification.MarkAsViewed();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
