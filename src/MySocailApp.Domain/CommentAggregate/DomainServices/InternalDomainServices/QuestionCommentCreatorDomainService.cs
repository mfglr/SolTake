using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Domain.CommentAggregate.DomainServices.InternalDomainServices
{
    internal static class QuestionCommentCreatorDomainService
    {
        public static async Task CreateAsync(IQuestionReadRepository questionReadRepository, Comment comment, int questionId, CancellationToken cancellationToken)
        {
            var question =
                    await questionReadRepository.GetAsync(questionId, cancellationToken) ??
                    throw new QuestionNotFoundException();

            comment.CreateQuestionComment(question.Id);

            if (question.AppUserId != comment.AppUserId)
                comment.AddDomainEvent(new QuestionCommentCreatedDomainEvent(question, comment));

            foreach (var tag in comment.Tags)
                if (tag.AppUserId != comment.AppUserId && tag.AppUserId != question.AppUserId)
                    comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, tag.AppUserId));
        }
    }
}
