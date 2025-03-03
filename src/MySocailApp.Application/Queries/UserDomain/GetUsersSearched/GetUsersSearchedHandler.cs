using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.GetUsersSearched
{
    public class GetUsersSearchedHandler(IUserSearchQueryRepository repository, IUserAccessor userAccessor) : IRequestHandler<GetUsersSearchedDto, List<UserSearchedResponseDto>>
    {
        private readonly IUserSearchQueryRepository _repository = repository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public Task<List<UserSearchedResponseDto>> Handle(GetUsersSearchedDto request, CancellationToken cancellationToken)
            => _repository
                .GetUsersSearched(
                    _userAccessor.User.Id,
                    _userAccessor.User.Id,
                    request,
                    cancellationToken
                );
    }
}
