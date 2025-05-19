using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.MessageDomain.GetConversations
{
    public class GetConversationsHandler(IMessageQueryRepository messageQueryRepository, IAccessTokenReader tokenReader) : IRequestHandler<GetConversationsDto, IEnumerable<MessageResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;

        public async Task<IEnumerable<MessageResponseDto>> Handle(GetConversationsDto request, CancellationToken cancellationToken)
        {
            var a = await _messageQueryRepository.GetConversationsAsync(_tokenReader.GetRequiredAccountId(), cancellationToken);

            return a;
        }
    }
}
