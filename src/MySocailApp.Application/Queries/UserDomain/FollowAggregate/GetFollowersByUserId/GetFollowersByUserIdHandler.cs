using MediatR;
using MySocailApp.Application.Queries.UserDomain.FollowAggregate;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.UserAggregate.GetFollowersByUserId
{
    public class GetFollowersByUserIdHandler(IFollowQueryRepository repository) : IRequestHandler<GetFollowersByUserIdDto, List<FollowerResponseDto>>
    {
        private readonly IFollowQueryRepository _repository = repository;

        public Task<List<FollowerResponseDto>> Handle(GetFollowersByUserIdDto request, CancellationToken cancellationToken)
            => _repository.GetFollowersByUserIdAsync(request.UserId, request, cancellationToken);
    }
}
