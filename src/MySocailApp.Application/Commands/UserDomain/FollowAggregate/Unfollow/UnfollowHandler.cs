using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserUserFollowAggregate.Exceptions;
using MySocailApp.Domain.UserUserFollowAggregate.Abstracts;

namespace MySocailApp.Application.Commands.UserDomain.FollowAggregate.Unfollow
{
    public class UnfollowHandler(IUnitOfWork unitOfWork, IUserUserFollowWriteRepository followWriteRepository, IUserAccessor userAccessor) : IRequestHandler<UnfollowDto>
    {
        private readonly IUserUserFollowWriteRepository _followWriteRepository = followWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UnfollowDto request, CancellationToken cancellationToken)
        {
            var follow = 
                await _followWriteRepository.GetAsync(_userAccessor.User.Id, request.FollowedId, cancellationToken) ??
                throw new NoFollowingFoundException();

            _followWriteRepository.Delete(follow);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
