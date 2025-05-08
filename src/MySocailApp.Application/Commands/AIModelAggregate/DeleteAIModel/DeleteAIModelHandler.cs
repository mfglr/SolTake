using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AIModelAggregate.Abstracts;
using MySocailApp.Domain.AIModelAggregate.DomainEvents;
using MySocailApp.Domain.AIModelAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AIModelAggregate.DeleteAIModel
{
    public class DeleteAIModelHandler(IAIModelCacheService aiModelCacheService, IAIModelRepository aiModelRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<DeleteAIModelDto>
    {
        private readonly IAIModelCacheService _aiModelCacheService = aiModelCacheService;
        private readonly IAIModelRepository _aiModelRepository = aiModelRepository;
        private readonly IPublisher _publisher = publisher;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteAIModelDto request, CancellationToken cancellationToken)
        {
            var model =
                await _aiModelRepository.GetAsync(request.Id, cancellationToken) ??
                throw new AIModelNotFoundException();

            _aiModelRepository.Delete(model);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new AIModelDeletedDomainEvent(model), cancellationToken);

            var cachedModel = _aiModelCacheService.Models.First(x => x.Id == request.Id);
            _aiModelCacheService.Remove(cachedModel);
        }
    }
}
