using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.FollowAggregate.Abstracts;
using MySocailApp.Domain.FollowAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.FollowAggregate.Unfollow
{
    public class UnfollowHandler(IUnitOfWork unitOfWork, IFollowWriteRepository followWriteRepository, IUserAccessor userAccessor) : IRequestHandler<UnfollowDto>
    {
        private readonly IFollowWriteRepository _followWriteRepository = followWriteRepository;
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
