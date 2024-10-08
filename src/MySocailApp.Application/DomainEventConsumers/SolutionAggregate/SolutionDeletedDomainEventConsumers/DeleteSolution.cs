using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Application.ApplicationServices.BlobService.VideoServices;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.SolutionAggregate.SolutionDeletedDomainEventConsumers
{
    public class DeleteSolution(IUnitOfWork unitOfWork, ICommentWriteRepository commentWriteRepository, ISolutionWriteRepository solutionWriteRepository, IImageService blobService, INotificationWriteRepository notificationWriteRepository, IVideoService videoService) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IImageService _blobService = blobService;
        private readonly IVideoService _videoService = videoService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solution = await _solutionWriteRepository.GetWithAllByIdAsync(notification.Solution.Id, cancellationToken);
            if (solution == null) return;

            foreach (var comment in solution.Comments)
            {
                comment.SetRepliedIdsAsNull();
                _commentWriteRepository.DeleteRange(comment.Children);
                _commentWriteRepository.Delete(comment);
            }

            _notificationWriteRepository.DeleteRange(solution.Notifications);
            _solutionWriteRepository.Delete(solution);
            _blobService.DeleteRange(ContainerName.SolutionImages, notification.Solution.Images.Select(x => x.BlobName));
            if (solution.Video != null)
                _videoService.Delete(ContainerName.SolutionVideos, solution.Video.BlobName);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
