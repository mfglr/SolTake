using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.NotificationAggregate.GetViewedNotifications
{
    public class GetViwedNotificationsHandler(INotificationQueryRepository repository, IAccessTokenReader tokenReader) : IRequestHandler<GetViewedNotificationsDto, List<NotificationResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly INotificationQueryRepository _repository = repository;

        public Task<List<NotificationResponseDto>> Handle(GetViewedNotificationsDto request, CancellationToken cancellationToken)
            => _repository.GetNotificationsViewedByOwnerId(_tokenReader.GetRequiredAccountId(), request, cancellationToken);
    }
}
