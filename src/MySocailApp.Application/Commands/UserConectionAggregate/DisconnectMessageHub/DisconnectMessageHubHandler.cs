using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.UserConectionAggregate.DisconnectMessageHub
{
    public class DisconnectMessageHubHandler(IAccessTokenReader tokenReader, IUnitOfWork unitOfWork, IUserConnectionWriteRepository repository) : IRequestHandler<DisconnectMessageHubDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IUserConnectionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DisconnectMessageHubDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var connection = await _repository.GetByIdAsync(accountId, cancellationToken);
            if (connection != null)
            {
                connection.Disconnect();
                await _unitOfWork.CommitAsync(cancellationToken);
            }
        }
    }
}
