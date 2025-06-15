using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SubjectAggregate.Abstracts;
using SolTake.Domain.SubjectAggregate.Exceptions;
using SolTake.Domain.TopicAggregate.Abstracts;
using SolTake.Domain.TopicRequestAggregate.Abstracts;
using SolTake.Domain.TopicRequestAggregate.DomainEvents;
using SolTake.Domain.TopicRequestAggregate.Entities;
using SolTake.Domain.TopicRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.TopicRequestAggregate.Create
{
    public class CreateTopicRequestHandler(ITopicRequestRepository topicCreationRepository, IUnitOfWork unitOfWork, IPublisher publisher, IAccessTokenReader accessTokenReader, ISubjectReadRepository subjectReadRepository, ITopicReadRepository topicReadRepository) : IRequestHandler<CreateTopicRequestDto, CreateTopicRequestResponseDto>
    {
        private readonly ITopicReadRepository _topicReadRepository = topicReadRepository;
        private readonly ISubjectReadRepository _subjectReadRepository = subjectReadRepository;
        private readonly ITopicRequestRepository _topicCreationRepository = topicCreationRepository;
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
            var topicRequest = new TopicRequest(request.SubjectId, userId, request.Name);
            topicRequest.Create();
            await _topicCreationRepository.CreateAsync(topicRequest, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new TopicRequestCreatedDomainEvent(topicRequest), cancellationToken);

            return new(topicRequest.Id);
        }
    }
}
