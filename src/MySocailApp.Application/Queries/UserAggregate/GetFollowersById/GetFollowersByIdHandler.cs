using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowersById
{
    public class GetFollowersByIdHandler(IFollowQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetFollowersByIdDto, List<FollowResponseDto>>
    {
        private readonly IFollowQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<FollowResponseDto>> Handle(GetFollowersByIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetFollowersAsync(
                    request.UserId,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
