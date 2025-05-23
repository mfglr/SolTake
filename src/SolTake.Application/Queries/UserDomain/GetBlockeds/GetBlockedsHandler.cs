using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.GetBlockeds
{
    public class GetBlockedsHandler(IUserUserBlockQueryRepository userUserBlockQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetBlockedsDto, List<UserUserBlockResponseDto>>
    {
        private readonly IUserUserBlockQueryRepository _userUserBlockQueryRepository = userUserBlockQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<UserUserBlockResponseDto>> Handle(GetBlockedsDto request, CancellationToken cancellationToken)
            => _userUserBlockQueryRepository.GetBlockedsByUserId(_accessTokenReader.GetRequiredAccountId(), request, cancellationToken);
    }
}
