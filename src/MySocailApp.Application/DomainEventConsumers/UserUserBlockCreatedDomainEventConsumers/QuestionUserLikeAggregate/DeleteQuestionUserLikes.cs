﻿using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.UserUserBlockAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.QuestionUserLikeAggregate
{
    public class DeleteQuestionUserLikes(IQuestionUserLikeWriteRepository questionUserLikeWriteRepository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var questionIdsOfBlocker = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var questionUserLikes0 = await _questionUserLikeWriteRepository.GetAsync(questionIdsOfBlocker, notification.UserUserBlock.BlockedId,cancellationToken);
            _questionUserLikeWriteRepository.DeleteRange(questionUserLikes0);

            var questionIdsOfBlocked = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var questionUserLikes1 = await _questionUserLikeWriteRepository.GetAsync(questionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _questionUserLikeWriteRepository.DeleteRange(questionUserLikes1);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
