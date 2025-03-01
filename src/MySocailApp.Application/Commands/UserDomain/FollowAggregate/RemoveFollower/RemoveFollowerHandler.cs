using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.FollowAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.FollowAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveFollower
{
    public class RemoveFollowerHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, IFollowWriteRepository followWriteRepository) : IRequestHandler<RemoveFollowerDto>
    {
        private readonly IFollowWriteRepository _followWriteRepository = followWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveFollowerDto request, CancellationToken cancellationToken)
        {
            var follow = 
                await _followWriteRepository.GetAsync(request.FollowerId, _userAccessor.User.Id, cancellationToken) ??
                throw new NoFollowingFoundException();

            _followWriteRepository.Delete(follow);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
