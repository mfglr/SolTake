using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetUnviewedNotifications
{
    public class GetUnviewedNotificationsHandler(INotificationReadRepository repository, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUnviewedNotificationsDto, List<NotificationResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly INotificationReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<NotificationResponseDto>> Handle(GetUnviewedNotificationsDto request, CancellationToken cancellationToken)
        {
            var ownerId = _accessTokenReader.GetRequiredAccountId(); 
            var notifications = await _repository.GetUnviewedNotificationsByOwnerId(ownerId, cancellationToken);
            return _mapper.Map<List<NotificationResponseDto>>(notifications);
        }
    }
}
