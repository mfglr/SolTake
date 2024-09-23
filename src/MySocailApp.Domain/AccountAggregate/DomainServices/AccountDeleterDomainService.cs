using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class AccountDeleterDomainService(IAppUserWriteRepository userWriteRepository, IQuestionWriteRepository questionWriteRepository, ISolutionWriteRepository solutionWriteRepository, ICommentWriteRepository commentWriteRepository, IMessageWriteRepository messageWriteRepository, UserManager<Account> userManager)
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly UserManager<Account> _userManager = userManager;

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
        }

        private void DeleteQuestion(Question question)
        {
            foreach (var comment in question.Comments)
                DeleteComment(comment);

            foreach (var solution in question.Solutions)
                DeleteSolution(solution);

            _questionWriteRepository.Delete(question);
        }

        public async Task DeleteAsync(int id, CancellationToken cancellationToken)
        {
            var user = await _userWriteRepository.GetWithAllAsync(id, cancellationToken);
            if (user == null) return;

            user.Delete();
            _messageWriteRepository.DeleteRange(user.MessagesReceived);

            foreach (var comment in user.Comments)
                DeleteComment(comment);
            foreach (var solution in user.Solutions)
                DeleteSolution(solution);
            foreach (var question in user.Questions)
                DeleteQuestion(question);

            _userWriteRepository.Delete(user);
            await _userManager.DeleteAsync(user.Account);
        }
    }
}
