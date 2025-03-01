using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.UserDomain.UserAggregate;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.UserAggregate.GetCreateConversationPageUsers
{
    public class GetCreateConversationPageUsersHandler(IUserQueryRepository appUserQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCreateConversationPageUsersDto, List<UserResponseDto>>
    {
        private readonly IUserQueryRepository _appUserQueryRepository = appUserQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<UserResponseDto>> Handle(GetCreateConversationPageUsersDto request, CancellationToken cancellationToken)
            => _appUserQueryRepository
                .GetCreateConversationPageUsersAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
