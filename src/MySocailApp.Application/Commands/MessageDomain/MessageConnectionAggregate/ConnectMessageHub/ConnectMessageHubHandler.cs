using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub
{
    public class ConnectMessageHubHandler(IAccessTokenReader tokenReader, IMessageConnectionWriteRepository repository, IUnitOfWork unitOfWork) : IRequestHandler<ConnectMessageHubDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMessageConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ConnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var userId = _tokenReader.GetRequiredAccountId();
            var connection = await _repository.GetByIdAsync(userId, cancellationToken);
            if (connection == null)
            {
                connection = new MessageConnection(userId);
                await _repository.CreateAsync(connection, cancellationToken);
            }
            connection.Connect(request.ConnectionId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
