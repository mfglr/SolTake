using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.SearchUsers
{
    public class SearchUserHandler(IAppUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<SearchUserDto, List<UserResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserQueryRepository _repository = repository;

        public Task<List<UserResponseDto>> Handle(SearchUserDto request, CancellationToken cancellationToken)
            => _repository
                .SearchUserAsync(
                    request.Key,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
