﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserUserFollowAggregate.Exceptions;
using MySocailApp.Domain.UserUserFollowAggregate.Abstracts;
using MySocailApp.Domain.UserUserFollowAggregate.DomainEvents;

namespace MySocailApp.Application.Commands.UserDomain.FollowAggregate.Unfollow
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
