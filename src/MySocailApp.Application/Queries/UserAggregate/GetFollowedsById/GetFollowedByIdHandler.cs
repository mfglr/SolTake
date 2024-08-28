using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public class GetFollowedByIdHandler(IFollowQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetFollowedsByIdDto, List<FollowResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        private readonly IFollowQueryRepository _repository = repository;

        public async Task<List<FollowResponseDto>> Handle(GetFollowedsByIdDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            return await _repository.GetFollowedsAsync(request.UserId, accountId, request, cancellationToken);
        }
    }
}
