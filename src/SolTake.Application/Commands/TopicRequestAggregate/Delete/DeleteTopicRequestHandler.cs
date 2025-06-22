using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.TopicRequestAggregate.Abstracts;
using SolTake.Domain.TopicRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.TopicRequestAggregate.Delete
{
    public class DeleteTopicRequestHandler(ITopicRequestRepository topicRequestRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<DeleteTopicRequestDto>
    {
        private readonly ITopicRequestRepository _topicRequestRepository = topicRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(DeleteTopicRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var topicRequest =
                await _topicRequestRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new TopicRequestNotFoundException();
            if (userId != topicRequest.UserId)
                throw new PermissionDeniedToDeleteTopicRequestException();
            _topicRequestRepository.Delete(topicRequest);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
