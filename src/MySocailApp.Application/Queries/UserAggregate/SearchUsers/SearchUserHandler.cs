using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.SearchUsers
{
    public class SearchUserHandler(IAppUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<SearchUserDto, List<AppUserResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserQueryRepository _repository = repository;

        public Task<List<AppUserResponseDto>> Handle(SearchUserDto request, CancellationToken cancellationToken)
            => _repository
                .SearchUserAsync(
                    request.Key,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
