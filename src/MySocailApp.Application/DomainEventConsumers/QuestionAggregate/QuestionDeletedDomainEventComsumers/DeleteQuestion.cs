using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.QuestionAggregate.QuestionDeletedDomainEventComsumers
{
    public class DeleteQuestion(IUnitOfWork unitOfWork, IQuestionWriteRepository questionWriteRepository, ICommentWriteRepository commentWriteRepository, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService, INotificationWriteRepository notificationWriteRepository) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IBlobService _blobService = blobService;

        private void DeleteComments(Comment comment)
        {
            comment.SetRepliedIdsAsNull();
            _commentWriteRepository.DeleteRange(comment.Children);
            _commentWriteRepository.Delete(comment);
        }

        public async Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var question = await _questionWriteRepository.GetQuestionWithAllAsync(notification.Question.Id, cancellationToken);
            if (question == null) return;

            _notificationWriteRepository.DeleteRange(question.Notifications);

            foreach (var comment in question.Comments)
                DeleteComments(comment);

            foreach (var solution in question.Solutions)
            {
                foreach (var comment in solution.Comments)
                    DeleteComments(comment);
                _solutionWriteRepository.Delete(solution);
                _blobService.DeleteRange(ContainerName.SolutionImages, solution.Images.Select(x => x.BlobName));
            }
            _questionWriteRepository.Delete(question);
            _blobService.DeleteRange(ContainerName.QuestionImages, question.Images.Select(x => x.BlobName));

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
