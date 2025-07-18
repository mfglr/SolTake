﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Domain.QuestionAggregate.Exceptions;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.PublishQuestion
{
    public class PublishQuestionHandler(IQuestionWriteRepository questionWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<PublishQuestionDto>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(PublishQuestionDto request, CancellationToken cancellationToken)
        {
            var question =
                await _questionWriteRepository.GetQuestionAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();
            question.Publish();
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new QuestionPublishedDomainEvent(question), cancellationToken);
        }
    }
}
