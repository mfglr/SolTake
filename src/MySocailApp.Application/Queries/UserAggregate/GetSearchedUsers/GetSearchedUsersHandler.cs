using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.GetSearchedUsers
{
    public class GetSearchedUsersHandler(IUserSearchQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSearchedUsersDto, List<UserSearchResponseDto>>
    {
        private readonly IUserSearchQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<UserSearchResponseDto>> Handle(GetSearchedUsersDto request, CancellationToken cancellationToken)
            => _repository
                .GetUserSearcheds(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
