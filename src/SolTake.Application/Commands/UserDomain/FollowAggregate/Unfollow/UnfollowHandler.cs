using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserUserFollowAggregate.Exceptions;
using SolTake.Domain.UserUserFollowAggregate.Abstracts;
using SolTake.Domain.UserUserFollowAggregate.DomainEvents;

namespace SolTake.Application.Commands.UserDomain.FollowAggregate.Unfollow
{
    public class UnfollowHandler(IUnitOfWork unitOfWork, IUserUserFollowWriteRepository followWriteRepository, IUserAccessor userAccessor, IPublisher publisher) : IRequestHandler<UnfollowDto>
    {
        private readonly IUserUserFollowWriteRepository _followWriteRepository = followWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UnfollowDto request, CancellationToken cancellationToken)
        {
            var userUserFollow =
                await _followWriteRepository.GetAsync(_userAccessor.User.Id, request.FollowedId, cancellationToken) ??
                throw new NoFollowingFoundException();

            _followWriteRepository.Delete(userUserFollow);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new UserUserFollowDeletedDomainEvent(userUserFollow), cancellationToken);
        }
    }
}
