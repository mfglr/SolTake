using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;

namespace SolTake.Application.Commands.NotificationDomain.NotificationConnectionAggregate.ConnectNotificationHub
{
    public class ConnectNotificationHubHandler(INotificationConnectionWriteRepository writeRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<ConnectNotificationHubDto>
    {
        private readonly INotificationConnectionWriteRepository _writeRepository = writeRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(ConnectNotificationHubDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var connection = await _writeRepository.GetByIdAsync(userId, cancellationToken);
            if (connection == null)
            {
                connection = new NotificationConnection(userId);
                await _writeRepository.CreateAsync(connection, cancellationToken);
            }
            connection.Connect(request.ConnectionId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
