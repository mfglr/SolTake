using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.TopicRequestAggregate.Abstracts;
using SolTake.Domain.TopicRequestAggregate.DomainEvents;
using SolTake.Domain.TopicRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.TopicRequestAggregate.Reject
{
    public class RejectTopicRequestHandler(ITopicRequestRepository topicRequestRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<RejectTopicRequestDto>
    {
        private readonly ITopicRequestRepository _topicRequestRepository = topicRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(RejectTopicRequestDto request, CancellationToken cancellationToken)
        {
            var topicRequest = 
                await _topicRequestRepository.GetByIdAsync(request.Id,cancellationToken) ??
                throw new TopicRequestNotFoundException();

            topicRequest.Reject(request.Reason);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new TopicRequestRejectedDomainEvent(topicRequest),cancellationToken);
        }
    }
}
