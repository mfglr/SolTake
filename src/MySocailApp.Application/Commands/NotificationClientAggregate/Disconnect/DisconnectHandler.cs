using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppNotificationClientAggregate;

namespace MySocailApp.Application.Commands.NotificationClientAggregate.Disconnect
{
    public class DisconnectHandler(IAppNotificationClientRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<DisconnectDto>
    {
        private readonly IAppNotificationClientRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        public async Task Handle(DisconnectDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var client = await _repository.GetByIdAsync(userId, cancellationToken);
            if (client == null)
                return;
            client.Disconnect();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
