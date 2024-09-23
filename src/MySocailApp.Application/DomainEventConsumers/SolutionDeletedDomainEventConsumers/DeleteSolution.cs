using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.SolutionDeletedDomainEventConsumers
{
    public class DeleteSolution(IUnitOfWork unitOfWork, ICommentWriteRepository commentWriteRepository, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService) : IDomainEventConsumer<SolutionDeletedDomainEvent>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IBlobService _blobService = blobService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var solution = await _solutionWriteRepository.GetWithCommentsByIdAsync(notification.Solution.Id, cancellationToken);
            if (solution == null) return;

            foreach (var comment in solution.Comments)
            {
                comment.SetRepliedIdsAsNull();
                _commentWriteRepository.DeleteRange(comment.Children);
                _commentWriteRepository.Delete(comment);
            }
            _solutionWriteRepository.Delete(solution);
            _blobService.DeleteRange(ContainerName.SolutionImages, notification.Solution.Images.Select(x => x.BlobName));

            await _unitOfWork.CommitAsync(cancellationToken);

        }
    }
}
