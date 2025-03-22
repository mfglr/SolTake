using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.DisconnectMessageHub
{
    public class DisconnectMessageHubHandler(IUnitOfWork unitOfWork, IMessageConnectionWriteRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<DisconnectMessageHubDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMessageConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DisconnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var connection = (await _repository.GetByIdAsync(userId, cancellationToken))!;
            connection.ChangeState(MessageConnectionState.Ofline);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
