using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainServices.InternalDomainServices
{
    internal static class QuestionCommentCreatorDomainService
    {
        public static async Task CreateAsync(IQuestionReadRepository questionReadRepository, Comment comment, int questionId, Login login, CancellationToken cancellationToken)
        {
            var questionUserId =
                    await questionReadRepository.GetUserIdOfQuestionAsync(questionId, cancellationToken) ??
                    throw new QuestionNotFoundException();

            comment.CreateQuestionComment(questionId);

            if (questionUserId != comment.UserId)
                comment.AddDomainEvent(new QuestionCommentCreatedDomainEvent(comment,questionUserId,login));

            foreach (var tag in comment.Tags)
                if (tag.UserId != comment.UserId && tag.UserId != questionUserId)
                    comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, tag.UserId));
        }
    }
}
