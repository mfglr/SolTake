using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions;

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

            if (question.UserId != comment.UserId)
                comment.AddDomainEvent(new QuestionCommentCreatedDomainEvent(question, comment));

            foreach (var tag in comment.Tags)
                if (tag.UserId != comment.UserId && tag.UserId != question.UserId)
                    comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, tag.UserId));
        }
    }
}
