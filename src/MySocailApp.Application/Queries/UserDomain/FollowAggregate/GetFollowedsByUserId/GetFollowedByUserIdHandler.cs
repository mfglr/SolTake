using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.UserDomain.FollowAggregate;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.UserAggregate.GetFollowedsByUserId
{
    public class GetFollowedByUserIdHandler(IFollowQueryRepository repository, IUserAccessor userAccessor) : IRequestHandler<GetFollowedsByUserIdDto, List<FollowedResponseDto>>
    {
        private readonly IFollowQueryRepository _repository = repository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        public Task<List<FollowedResponseDto>> Handle(GetFollowedsByUserIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetFollowedsByUserIdAsync(
                    request.UserId,
                    request,
                    _userAccessor.User.Id,
                    cancellationToken
                );

    }
}
