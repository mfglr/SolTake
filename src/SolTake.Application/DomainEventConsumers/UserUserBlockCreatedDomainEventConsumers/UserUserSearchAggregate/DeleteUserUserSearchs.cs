﻿using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Domain.UserUserSearchAggregate.Abstracts;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.UserUserSearchAggregate
{
    public class DeleteUserUserSearchs(IUserUserSearchWriteRepository userUserSearchWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IUserUserSearchWriteRepository _userUserSearchWriteRepository = userUserSearchWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var userUserSearchs = await _userUserSearchWriteRepository.GetByUserIds(notification.UserUserBlock.BlockerId,notification.UserUserBlock.BlockedId,cancellationToken);
            _userUserSearchWriteRepository.DeleteRange(userUserSearchs);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
