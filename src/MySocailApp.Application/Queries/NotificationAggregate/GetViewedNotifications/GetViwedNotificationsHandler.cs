using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetViewedNotifications
{
    public class GetViwedNotificationsHandler(INotificationReadRepository repository, IMapper mapper, IAccessTokenReader tokenReader) : IRequestHandler<GetViewedNotificationsDto, List<NotificationResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly INotificationReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<NotificationResponseDto>> Handle(GetViewedNotificationsDto request, CancellationToken cancellationToken)
        {
            var ownerId = _tokenReader.GetRequiredAccountId();
            var notifications = await _repository.GetViewedNotificationsByOwnerId(ownerId, request, cancellationToken);
            return _mapper.Map<List<NotificationResponseDto>>(notifications);
        }
    }
}
