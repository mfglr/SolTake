using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDeletedDomainEventComsumers
{
    public class DeleteImages(IBlobService blobService) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly IBlobService _blobService = blobService;

        public Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _blobService.DeleteRange(ContainerName.QuestionImages, notification.Question.Images.Select(x => x.BlobName));
            return Task.CompletedTask;
        }
    }
}
