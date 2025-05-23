using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.SearchUsers
{
    public class SearchUserHandler(IUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<SearchUserDto, List<SearchUserResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUserQueryRepository _repository = repository;

        public Task<List<SearchUserResponseDto>> Handle(SearchUserDto request, CancellationToken cancellationToken)
            => _repository
                .SearchUserAsync(
                    request.Key,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
