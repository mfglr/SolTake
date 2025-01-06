using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.GetNotFolloweds
{
    public class GetNotFollowedsHandler(IAppUserQueryRepository userQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetNotFollowedsDto, List<UserResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserQueryRepository _userQueryRepository = userQueryRepository;

        public async Task<List<UserResponseDto>> Handle(GetNotFollowedsDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            return await _userQueryRepository.GetNotFollowedsAsync(request.Id, accountId, request, cancellationToken);
        }
    }
}
