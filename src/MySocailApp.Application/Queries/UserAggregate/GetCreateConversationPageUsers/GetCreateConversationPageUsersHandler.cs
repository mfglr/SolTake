using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.GetCreateConversationPageUsers
{
    public class GetCreateConversationPageUsersHandler(IAppUserQueryRepository appUserQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCreateConversationPageUsersDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserQueryRepository _appUserQueryRepository = appUserQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<AppUserResponseDto>> Handle(GetCreateConversationPageUsersDto request, CancellationToken cancellationToken)
            => _appUserQueryRepository
                .GetCreateConversationPageUsersAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
