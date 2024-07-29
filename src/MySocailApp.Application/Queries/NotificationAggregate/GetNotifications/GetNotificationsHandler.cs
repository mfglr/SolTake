using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetNotifications
{
    public class GetNotificationsHandler(INotificationReadRepository repository, IMapper mapper, IAccessTokenReader tokenReader) : IRequestHandler<GetNotificationsDto, List<NotificationResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly INotificationReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<NotificationResponseDto>> Handle(GetNotificationsDto request, CancellationToken cancellationToken)
        {
            var ownerId = _tokenReader.GetRequiredAccountId();
            var notifications = await _repository.GetNotificationsByOwnerId(ownerId, request.LastId, request.Take, cancellationToken);
            return _mapper.Map<List<NotificationResponseDto>>(notifications);
        }
    }
}
