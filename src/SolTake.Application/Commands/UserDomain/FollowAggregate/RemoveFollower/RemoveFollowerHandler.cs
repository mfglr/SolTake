using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserUserFollowAggregate.Abstracts;
using SolTake.Domain.UserUserFollowAggregate.DomainEvents;
using SolTake.Domain.UserUserFollowAggregate.Exceptions;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.RemoveFollower
{
    public class RemoveFollowerHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, IUserUserFollowWriteRepository userUserfollowWriteRepository, IPublisher publisher) : IRequestHandler<RemoveFollowerDto>
    {
        private readonly IUserUserFollowWriteRepository _userUserfollowWriteRepository = userUserfollowWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(RemoveFollowerDto request, CancellationToken cancellationToken)
        {
            var userUserFollow =
                await _userUserfollowWriteRepository.GetAsync(request.FollowerId, _userAccessor.User.Id, cancellationToken) ??
                throw new NoFollowingFoundException();
            _userUserfollowWriteRepository.Delete(userUserFollow);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new UserUserFollowDeletedDomainEvent(userUserFollow), cancellationToken);
        }
    }
}
