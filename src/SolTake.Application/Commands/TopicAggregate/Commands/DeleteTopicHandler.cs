using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.QuestionAggregate.Exceptions;
using SolTake.Domain.TopicAggregate.Abstracts;
using SolTake.Domain.TopicAggregate.DomainEvents;

namespace SolTake.Application.Commands.TopicAggregate.Commands
{
    public class DeleteTopicHandler(ITopicWriteRepository topicWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<DeleteTopicDto>
    {
        private readonly ITopicWriteRepository _topicWriteRepository = topicWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(DeleteTopicDto request, CancellationToken cancellationToken)
        {
            var topic = 
                await _topicWriteRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new TopicNotFoundException();
            _topicWriteRepository.Delete(topic);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new TopicDeletedDomainEvent(topic), cancellationToken);
        }
    }
}
