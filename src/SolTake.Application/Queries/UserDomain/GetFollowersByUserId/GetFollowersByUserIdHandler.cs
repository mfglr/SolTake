using MediatR;
using SolTake.Application.InfrastructureServices;
using MySocailApp.Application.Queries.UserDomain.GetFollowedsByUserId;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.GetFollowersByUserId
{
    public class GetFollowersByUserIdHandler(IFollowQueryRepository repository, IUserAccessor userAccessor) : IRequestHandler<GetFollowersByUserIdDto, List<FollowResponseDto>>
    {
        private readonly IFollowQueryRepository _repository = repository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public Task<List<FollowResponseDto>> Handle(GetFollowersByUserIdDto request, CancellationToken cancellationToken)
            => _repository.GetFollowersByUserIdAsync(request.UserId, request, _userAccessor.User.Id, cancellationToken);
    }
}
