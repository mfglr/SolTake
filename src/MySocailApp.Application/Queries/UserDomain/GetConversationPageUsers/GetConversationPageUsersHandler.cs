using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.GetConversationPageUsers
{
    public class GetConversationPageUsersHandler(IUserQueryRepository appUserQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetConversationPageUsersDto, List<UserResponseDto>>
    {
        private readonly IUserQueryRepository _appUserQueryRepository = appUserQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<UserResponseDto>> Handle(GetConversationPageUsersDto request, CancellationToken cancellationToken)
            => _appUserQueryRepository
                .GetCreateConversationPageUsersAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
