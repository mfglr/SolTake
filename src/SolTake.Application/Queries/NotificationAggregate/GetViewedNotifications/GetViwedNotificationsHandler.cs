using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetViewedNotifications
{
    public class GetViwedNotificationsHandler(INotificationQueryRepository repository, IAccessTokenReader tokenReader) : IRequestHandler<GetViewedNotificationsDto, List<NotificationResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly INotificationQueryRepository _repository = repository;

        public Task<List<NotificationResponseDto>> Handle(GetViewedNotificationsDto request, CancellationToken cancellationToken)
            => _repository.GetNotificationsViewedByOwnerId(_tokenReader.GetRequiredAccountId(), request, cancellationToken);
    }
}
