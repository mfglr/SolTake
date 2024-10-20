using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.MessageAggregate.Exceptions;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessageById
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
