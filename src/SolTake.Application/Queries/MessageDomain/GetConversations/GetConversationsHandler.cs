using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.MessageDomain.GetConversations
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
