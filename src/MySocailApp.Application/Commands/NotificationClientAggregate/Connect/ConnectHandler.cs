using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppNotificationClientAggregate;

namespace MySocailApp.Application.Commands.NotificationClientAggregate.Connect
{
    public class ConnectHandler(IAppNotificationClientRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<ConnectDto>
    {
        private readonly IAppNotificationClientRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ConnectDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var client = await _repository.GetByIdAsync(userId, cancellationToken);
            if (client == null)
            {
                client = new AppNotificationClient(userId);
                client.Connect(request.ConnectionId);
                await _repository.CreateAsync(client, cancellationToken);
            }
            else
                client.Connect(request.ConnectionId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
