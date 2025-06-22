using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SubjectAggregate.Abstracts;
using SolTake.Domain.SubjectAggregate.Exceptions;
using SolTake.Domain.TopicAggregate.Abstracts;
using SolTake.Domain.TopicRequestAggregate.Abstracts;
using SolTake.Domain.TopicRequestAggregate.DomainEvents;
using SolTake.Domain.TopicRequestAggregate.Entities;
using SolTake.Domain.TopicRequestAggregate.Exceptions;
using SolTake.Domain.TopicRequestAggregate.ValueObjects;

namespace SolTake.Application.Commands.TopicRequestAggregate.Create
{
    public class CreateTopicRequestHandler(ITopicRequestRepository topicRequestRepository, IUnitOfWork unitOfWork, IPublisher publisher, IAccessTokenReader accessTokenReader, ISubjectReadRepository subjectReadRepository, ITopicReadRepository topicReadRepository) : IRequestHandler<CreateTopicRequestDto, CreateTopicRequestResponseDto>
    {
        private readonly ITopicReadRepository _topicReadRepository = topicReadRepository;
        private readonly ISubjectReadRepository _subjectReadRepository = subjectReadRepository;
        private readonly ITopicRequestRepository _topicRequestRepository = topicRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<CreateTopicRequestResponseDto> Handle(CreateTopicRequestDto request, CancellationToken cancellationToken)
        {
            if (!await _subjectReadRepository.ExistAsync(request.SubjectId, cancellationToken))
                throw new SubjectNotFoundException();
            if (await _topicReadRepository.ExistByNameAsync(request.Name, cancellationToken))
                throw new TopicNameAlreadyDefinedException();

            var userId = _accessTokenReader.GetRequiredAccountId();
            var topicName = new TopicName(request.Name);
            var topicRequest = new TopicRequest(request.SubjectId, userId, topicName);
            topicRequest.Create();
            await _topicRequestRepository.CreateAsync(topicRequest, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new TopicRequestCreatedDomainEvent(topicRequest), cancellationToken);

            return new(topicRequest.Id);
        }
    }
}
