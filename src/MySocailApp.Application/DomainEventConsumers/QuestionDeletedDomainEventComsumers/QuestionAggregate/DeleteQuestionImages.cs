using MySocailApp.Application.InfrastructureServices.BlobService.ImageServices;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDeletedDomainEventComsumers.QuestionAggregate
{
    public class DeleteQuestionImages(IImageService imageService) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly IImageService _imageService = imageService;

        public Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            _imageService.DeleteRange(ContainerName.QuestionImages, notification.Question.Images.Select(x => x.BlobName));
            return Task.CompletedTask;
        }
    }
}
