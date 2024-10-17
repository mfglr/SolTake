using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionAggregate.QuestionDeletedDomainEventComsumers
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
