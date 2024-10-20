using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public class GetFollowedByIdHandler(IFollowQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetFollowedsByIdDto, List<FollowResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IFollowQueryRepository _repository = repository;

        public Task<List<FollowResponseDto>> Handle(GetFollowedsByIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetFollowedsAsync(
                    request.UserId,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
        
    }
}
