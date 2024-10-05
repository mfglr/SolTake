using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.AccountAggregate.AccountDeletedDomainEventConsumers
{
    public class DeleteAccount(IAppUserWriteRepository userWriteRepository, IQuestionWriteRepository questionWriteRepository, ISolutionWriteRepository solutionWriteRepository, ICommentWriteRepository commentWriteRepository, IMessageWriteRepository messageWriteRepository, UserManager<Account> userManager, IBlobService blobService, INotificationWriteRepository notificationWriteRepository) : IDomainEventConsumer<AccountDeletedDomainEvent>
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IBlobService _blobService = blobService;

        private void DeleteComment(Comment comment)
        {
            comment.SetRepliedIdsAsNull();
            _commentWriteRepository.DeleteRange(comment.Children);
            _commentWriteRepository.Delete(comment);
        }

        private void DeleteSolution(Solution solution)
        {
            foreach (var comment in solution.Comments)
                DeleteComment(comment);
            _solutionWriteRepository.Delete(solution);
            _blobService.DeleteRange(ContainerName.SolutionImages, solution.Images.Select(x => x.BlobName));
        }

        private void DeleteQuestion(Question question)
        {
            foreach (var comment in question.Comments)
                DeleteComment(comment);

            foreach (var solution in question.Solutions)
                DeleteSolution(solution);

            _blobService.DeleteRange(ContainerName.QuestionImages, question.Images.Select(x => x.BlobName));
            _questionWriteRepository.Delete(question);
        }

        public async Task Handle(AccountDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var user = await _userWriteRepository.GetWithAllAsync(notification.Account.Id, cancellationToken);
            if (user == null) return;

            _messageWriteRepository.DeleteRange(user.MessagesReceived);
            _notificationWriteRepository.DeleteRange(user.NotificationsIncoming);
            _notificationWriteRepository.DeleteRange(user.NotificationsOutgoing);

            foreach (var comment in user.Comments)
                DeleteComment(comment);
            foreach (var solution in user.Solutions)
                DeleteSolution(solution);
            foreach (var question in user.Questions)
                DeleteQuestion(question);
            if (user.Image?.BlobName != null)
                _blobService.Delete(ContainerName.UserImages, user.Image.BlobName);

            _userWriteRepository.Delete(user);
            await _userManager.DeleteAsync(user.Account);
        }
    }
}
