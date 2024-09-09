using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.MessageAggregate.GetConversations
{
    public class GetConversationsHandler(IMessageQueryRepository messageQueryRepository, IAccessTokenReader tokenReader) : IRequestHandler<GetConversationsDto, List<MessageResponseDto>>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IMessageQueryRepository _messageQueryRepository = messageQueryRepository;

        public Task<List<MessageResponseDto>> Handle(GetConversationsDto request, CancellationToken cancellationToken)
            => _messageQueryRepository
                .GetConversationsAsync(
                    _tokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
