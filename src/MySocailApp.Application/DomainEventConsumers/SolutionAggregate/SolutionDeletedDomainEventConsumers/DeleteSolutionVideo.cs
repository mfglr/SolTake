using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Application.ApplicationServices.BlobService.VideoServices;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionAggregate.SolutionDeletedDomainEventConsumers
{
    public class DeleteSolutionVideo(IVideoService videoService) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly IVideoService _videoService = videoService;

        public Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.Solution.HasVideo)
                _videoService.Delete(ContainerName.SolutionVideos, notification.Solution.Video!.BlobName);
            return Task.CompletedTask;
        }
    }
}
