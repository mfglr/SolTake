using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Exceptions;

namespace MySocailApp.Domain.CommentAggregate.DomainServices.InternalDomainServices
{
    internal static class ReplyCommentCreatorDomainService
    {
        public static async Task CreateAsync(ICommentReadRepository commentReadRepository, Comment comment, int repliedId, CancellationToken cancellationToken)
        {
            var repliedComment =
                await commentReadRepository.GetAsync(repliedId, cancellationToken) ??
                throw new CommentNotFoundException();

            Comment parent;
            if (repliedComment.ParentId != null)
            {
                parent =
                    await commentReadRepository.GetAsync((int)repliedComment.ParentId, cancellationToken) ??
                    throw new CommentNotFoundException();

                if (parent.ParentId != null)
                    throw new CommentIsNotRootException();
                comment.CreateReplyComment(parent.Id, repliedId);
            }
            else
            {
                parent = repliedComment;
                comment.CreateReplyComment(repliedId, repliedId);
            }

            if (repliedComment.AppUserId != comment.AppUserId)
                comment.AddDomainEvent(new CommentRepliedDomainEvent(comment, parent, repliedComment));

            foreach (var tag in comment.Tags)
                if (tag.UserId != comment.AppUserId && tag.UserId != repliedComment.AppUserId)
                    comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, tag.UserId));
        }
    }
}
