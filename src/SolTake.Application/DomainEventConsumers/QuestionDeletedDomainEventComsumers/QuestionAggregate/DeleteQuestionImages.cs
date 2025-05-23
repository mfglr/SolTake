using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.QuestionDeletedDomainEventComsumers.QuestionAggregate
{
    public class DeleteQuestionImages(IBlobService blobService) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public async Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            foreach(var meida in notification.Question.Medias)
                await _blobService.DeleteAsync(ContainerName.QuestionMedias, meida.BlobName, cancellationToken);
        }
    }
}
