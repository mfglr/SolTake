using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.MarkMessagesAsReceived
{
    public class MarkMessagesAsReceivedHandler(IMessageWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<MarkMessagesAsReceivedDto>
    {
        private readonly IMessageWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MarkMessagesAsReceivedDto request, CancellationToken cancellationToken)
        {
            var receiverId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _repository.GetByIds(request.Ids, cancellationToken);

            foreach (var message in messages)
                message.MarkAsReceived(receiverId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
