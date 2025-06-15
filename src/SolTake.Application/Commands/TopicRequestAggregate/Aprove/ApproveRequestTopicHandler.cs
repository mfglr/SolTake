using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.TopicRequestAggregate.Abstracts;
using SolTake.Domain.TopicRequestAggregate.DomainEvents;
using SolTake.Domain.TopicRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.TopicRequestAggregate.Aprove
{
    public class ApproveRequestTopicHandler(ITopicRequestRepository topicRequestRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<ApproveTopicRequestDto>
    {
        private readonly ITopicRequestRepository _topicRequestRepository = topicRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(ApproveTopicRequestDto request, CancellationToken cancellationToken)
        {
            var topicRequest =
                await _topicRequestRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new TopicRequestNotFoundException();
            topicRequest.Approve();
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new TopicRequestApprovedDomainEvent(topicRequest), cancellationToken);
        }
    }
}
