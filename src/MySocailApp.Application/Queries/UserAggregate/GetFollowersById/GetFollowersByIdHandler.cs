using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowersById
{
    public class GetFollowersByIdHandler(IFollowQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetFollowersByIdDto, List<FollowResponseDto>>
    {
        private readonly IFollowQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<FollowResponseDto>> Handle(GetFollowersByIdDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            return await _repository.GetFollowersAsync(request.UserId, accountId, request, cancellationToken);
        }
    }
}
