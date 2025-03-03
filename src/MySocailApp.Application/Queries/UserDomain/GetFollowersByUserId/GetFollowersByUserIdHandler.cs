using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.GetFollowersByUserId
{
    public class GetFollowersByUserIdHandler(IFollowQueryRepository repository, IUserAccessor userAccessor) : IRequestHandler<GetFollowersByUserIdDto, List<FollowerResponseDto>>
    {
        private readonly IFollowQueryRepository _repository = repository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public Task<List<FollowerResponseDto>> Handle(GetFollowersByUserIdDto request, CancellationToken cancellationToken)
            => _repository.GetFollowersByUserIdAsync(request.UserId, request, _userAccessor.User.Id, cancellationToken);
    }
}
