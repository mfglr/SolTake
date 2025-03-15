using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.RemoveMessages
{
    public class RemoveMessagesHandler(IMessageWriteRepository messageWriteRepository,IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<RemoveMessagesDto>
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;


        public async Task Handle(RemoveMessagesDto request, CancellationToken cancellationToken)
        {
            var removerId = _accessTokenReader.GetRequiredAccountId();
            var messsages = await _messageWriteRepository.GetMessagesWithRemovers(request.MessageIds, cancellationToken);

            //foreach (var message in messsages)
            //    await _messageRemover.RemoveAsync(message, removerId, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
