using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.MessageAggregate.AddReceiverToMessages
{
    public class AddReceiverToMessagesHandler(IMessageWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, MessageStateUpdaterDomainService stateUpdater) : IRequestHandler<AddReceiverToMessagesDto>
    {
        private readonly IMessageWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly MessageStateUpdaterDomainService _stateUpdater = stateUpdater;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(AddReceiverToMessagesDto request, CancellationToken cancellationToken)
        {
            var receiverId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _repository.GetByIds(request.Ids, cancellationToken);
            await _stateUpdater.AddReceiverAsync(messages, receiverId, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
