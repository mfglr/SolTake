using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.DisconnectMessageHub
{
    public class DisconnectMessageHubHandler(IAccessTokenReader tokenReader, IUnitOfWork unitOfWork, IMessageConnectionWriteRepository repository) : IRequestHandler<DisconnectMessageHubDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMessageConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DisconnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var connection = await _repository.GetByIdAsync(accountId, cancellationToken);
            if (connection != null)
            {
                connection.SetStateAsOfline();
                await _unitOfWork.CommitAsync(cancellationToken);
            }
        }
    }
}
