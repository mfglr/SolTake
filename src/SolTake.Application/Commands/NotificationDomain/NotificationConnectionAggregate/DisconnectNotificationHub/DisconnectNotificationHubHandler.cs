using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.NotificationDomain.NotificationConnectionAggregate.DisconnectNotificationHub
{
    public class DisconnectNotificationHubHandler(IAccessTokenReader accessTokenReader, INotificationConnectionWriteRepository writeRepository, IUnitOfWork unitOfWork) : IRequestHandler<DisconnectNotificationHubDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly INotificationConnectionWriteRepository _writeRepository = writeRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DisconnectNotificationHubDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var notification = await _writeRepository.GetByIdAsync(userId, cancellationToken);
            if (notification == null) return;

            notification.Disconnect();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
