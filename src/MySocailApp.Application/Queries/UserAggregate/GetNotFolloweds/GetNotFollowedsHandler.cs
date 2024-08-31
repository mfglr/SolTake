using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.GetNotFolloweds
{
    public class GetNotFollowedsHandler(IAppUserQueryRepository userQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetNotFollowedsDto, List<AppUserResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserQueryRepository _userQueryRepository = userQueryRepository;

        public async Task<List<AppUserResponseDto>> Handle(GetNotFollowedsDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            return await _userQueryRepository.GetNotFollowedsAsync(request.Id, accountId, request, cancellationToken);
        }
    }
}
