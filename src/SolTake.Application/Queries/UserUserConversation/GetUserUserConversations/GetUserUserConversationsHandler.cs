using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserUserConversation.GetUserUserConversations
{
    public class GetUserUserConversationsHandler(IUserUserConversationQueryRepository userUserConversationQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUserUserConversationsDto, List<UserUserConversationResponseDto>>
    {
        private readonly IUserUserConversationQueryRepository _userUserConversationQueryRepository = userUserConversationQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<UserUserConversationResponseDto>> Handle(GetUserUserConversationsDto request, CancellationToken cancellationToken)
            => _userUserConversationQueryRepository.GetAsync(_accessTokenReader.GetRequiredAccountId(), request, cancellationToken);
    }
}
