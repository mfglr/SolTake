using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub
{
    public class ConnectMessageHubHandler(IMessageConnectionWriteRepository repository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<ConnectMessageHubDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ConnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var connection = await _repository.GetByIdAsync(userId, cancellationToken);
            if (connection == null)
            {
                connection = MessageConnection.Create(userId, request.ConnectionId);
                await _repository.CreateAsync(connection, cancellationToken);
            }
            connection.ChangeState(MessageConnectionState.Online);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
