using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.MessageDomain.GetUnviewedMessages
{
    public class GetUnviewedMessagesHandler(IMessageQueryRepository messageQueryRepository, IAccessTokenReader tokenReader) : IRequestHandler<GetUnviewedMessagesDto, List<MessageResponseDto>>
    {
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;
        private readonly IAccessTokenReader _tokenReader = tokenReader;

        public Task<List<MessageResponseDto>> Handle(GetUnviewedMessagesDto request, CancellationToken cancellationToken)
            => _messageQueryRepository
                .GetUnviewedMessagesAsync(
                    _tokenReader.GetRequiredAccountId(),
                    cancellationToken
                );
    }
}
