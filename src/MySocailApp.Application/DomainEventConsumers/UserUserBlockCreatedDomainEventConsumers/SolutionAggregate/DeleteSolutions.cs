﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.UserUserBlockAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.SolutionAggregate
{
    public class DeleteSolutions(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository, IPublisher publisher) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var questionIdsOfBlocker = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var solutions0 = await _solutionWriteRepository.GetAsync(questionIdsOfBlocker, notification.UserUserBlock.BlockedId, cancellationToken);
            _solutionWriteRepository.DeleteRange(solutions0);

            var questionIdsOfBlocked = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var solutions1 = await _solutionWriteRepository.GetAsync(questionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _solutionWriteRepository.DeleteRange(solutions1);

            await _unitOfWork.CommitAsync(cancellationToken);

            List<Solution> solutions = [..solutions0, ..solutions1];
            foreach (var solution in solutions)
                await _publisher.Publish(new SolutionDeletedDomainEvent(solution), cancellationToken);

        }
    }
}
