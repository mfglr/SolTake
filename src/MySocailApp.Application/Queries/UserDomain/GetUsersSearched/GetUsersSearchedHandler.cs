using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.UserDomain.GetUsersSearched
{
    public class GetUsersSearchedHandler(IUserUserSearchQueryRepository repository, IUserAccessor userAccessor) : IRequestHandler<GetUsersSearchedDto, List<UserUserSearchResponseDto>>
    {
        private readonly IUserUserSearchQueryRepository _repository = repository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public Task<List<UserUserSearchResponseDto>> Handle(GetUsersSearchedDto request, CancellationToken cancellationToken)
            => _repository.GetUsersSearched(_userAccessor.User.Id,request,cancellationToken);
    }
}
