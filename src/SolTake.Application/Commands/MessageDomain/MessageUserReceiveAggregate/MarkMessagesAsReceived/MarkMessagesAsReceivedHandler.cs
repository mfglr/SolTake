using MediatR;
using SolTake.Application.Commands.MessageDomain.MessageUserReceiveAggregate.MarkMessagesAsReceived;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.MessageUserReceiveAggregate.Abstracts;
using SolTake.Domain.MessageUserReceiveAggregate.Entities;

namespace SolTake.Application.Commands.MessageDomain.MessageUserReceiveAggregate.MarkMessagesAsReceived
{
    public class MarkMessagesAsReceivedHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IMessageUserReceiveWriteRepository messageUserReceiveWriteRepository, IMessageUserReceiveReadRepository messageUserReceiveReadRepository) : IRequestHandler<MarkMessagesAsReceivedDto>
    {
        private readonly IMessageUserReceiveWriteRepository _messageUserReceiveWriteRepository = messageUserReceiveWriteRepository;
        private readonly IMessageUserReceiveReadRepository _messageUserReceiveReadRepository = messageUserReceiveReadRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MarkMessagesAsReceivedDto request, CancellationToken cancellationToken)
        {
            var receiverId = _accessTokenReader.GetRequiredAccountId();
            var messageIds = await _messageUserReceiveReadRepository.GetIdOfMessagesNotReceivedByUser(request.MessageIds, receiverId, cancellationToken);
            var messageUserReceives = messageIds.Select(x => MessageUserReceive.Create(x,receiverId));
            await _messageUserReceiveWriteRepository.CreateRangeAsync(messageUserReceives, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
