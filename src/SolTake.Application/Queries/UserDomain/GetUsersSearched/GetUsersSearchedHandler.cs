using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.UserDomain.GetUsersSearched
{
    public class GetUsersSearchedHandler(IUserUserSearchQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUsersSearchedDto, List<UserUserSearchResponseDto>>
    {
        private readonly IUserUserSearchQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        public Task<List<UserUserSearchResponseDto>> Handle(GetUsersSearchedDto request, CancellationToken cancellationToken)
            => _repository.GetUsersSearched(_accessTokenReader.GetRequiredAccountId(), _accessTokenReader.GetRequiredAccountId(), request, cancellationToken);
    }
}
