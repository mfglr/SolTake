using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.SearchUsers
{
    public class SearchUserHandler(IAppUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<SearchUserDto, List<AppUserResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserQueryRepository _repository = repository;

        public async Task<List<AppUserResponseDto>> Handle(SearchUserDto request, CancellationToken cancellationToken)
            => await _repository
                .SearchUserAsync(
                    request.Key,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
