using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetUnviewedNotifications
{
    public class GetUnviewedNotificationsHandler(INotificationQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUnviewedNotificationsDto, List<NotificationResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly INotificationQueryRepository _repository = repository;

        public Task<List<NotificationResponseDto>> Handle(GetUnviewedNotificationsDto request, CancellationToken cancellationToken)
            => _repository.GetNotificationsUnviewedByOwnerId(_accessTokenReader.GetRequiredAccountId(), cancellationToken);
    }
}
