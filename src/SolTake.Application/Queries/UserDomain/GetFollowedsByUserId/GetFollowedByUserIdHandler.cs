using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.UserDomain.GetFollowedsByUserId
{
    public class GetFollowedByUserIdHandler(IFollowQueryRepository repository, IUserAccessor userAccessor) : IRequestHandler<GetFollowedsByUserIdDto, List<FollowResponseDto>>
    {
        private readonly IFollowQueryRepository _repository = repository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        public Task<List<FollowResponseDto>> Handle(GetFollowedsByUserIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetFollowedsByUserIdAsync(
                    request.UserId,
                    request,
                    _userAccessor.User.Id,
                    cancellationToken
                );

    }
}
