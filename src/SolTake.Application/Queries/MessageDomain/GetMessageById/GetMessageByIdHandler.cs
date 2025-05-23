using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.MessageAggregate.Exceptions;

namespace SolTake.Application.Queries.MessageDomain.GetMessageById
{
    public class GetMessageByIdHandler(IMessageQueryRepository messageQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetMessageByIdDto, MessageResponseDto>
    {
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<MessageResponseDto> Handle(GetMessageByIdDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var message =
                await _messageQueryRepository.GetMessageByIdAsync(accountId, request.MessageId, cancellationToken) ??
                throw new MessageNotFoundException();

            if (message.SenderId != accountId && message.ReceiverId != accountId)
                throw new PermissionDeinedToAccessMessageException();
            
            return message;
        }
    }
}
