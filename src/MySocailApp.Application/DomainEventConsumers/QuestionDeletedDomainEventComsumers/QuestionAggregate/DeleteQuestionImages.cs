using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDeletedDomainEventComsumers.QuestionAggregate
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
