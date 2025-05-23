using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.NotificationAggregate.GetUnviewedNotifications
{
    public class GetUnviewedNotificationsHandler(INotificationQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUnviewedNotificationsDto, List<NotificationResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly INotificationQueryRepository _repository = repository;

        public Task<List<NotificationResponseDto>> Handle(GetUnviewedNotificationsDto request, CancellationToken cancellationToken)
            => _repository.GetNotificationsUnviewedByOwnerId(_accessTokenReader.GetRequiredAccountId(), cancellationToken);
    }
}
