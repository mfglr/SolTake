using MediatR;
using MySocailApp.Application.Queries.UserDomain.FollowAggregate;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.UserAggregate.GetFollowedsByUserId
{
    public class GetFollowedByUserIdHandler(IFollowQueryRepository repository) : IRequestHandler<GetFollowedsByUserIdDto, List<FollowedResponseDto>>
    {
        private readonly IFollowQueryRepository _repository = repository;

        public Task<List<FollowedResponseDto>> Handle(GetFollowedsByUserIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetFollowedsByUserIdAsync(
                    request.UserId,
                    request,
                    cancellationToken
                );

    }
}
