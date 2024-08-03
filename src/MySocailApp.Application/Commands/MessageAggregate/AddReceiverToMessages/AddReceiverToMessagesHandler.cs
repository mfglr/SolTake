using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.MessageAggregate.AddReceiverToMessages
{
    public class AddReceiverToMessagesHandler(IMessageWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<AddReceiverToMessagesDto>
    {
        private readonly IMessageWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(AddReceiverToMessagesDto request, CancellationToken cancellationToken)
        {
            var receiverId = _accessTokenReader.GetRequiredAccountId();
            var messages = await _repository.GetByIds(request.Ids, cancellationToken);

            foreach(var message in messages)
                message.AddReceiver(receiverId);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
