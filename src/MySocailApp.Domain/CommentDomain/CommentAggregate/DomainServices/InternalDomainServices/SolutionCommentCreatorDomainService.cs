using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainServices.InternalDomainServices
{
    internal static class SolutionCommentCreatorDomainService
    {
        public static async Task CreateAsync(ISolutionReadRepository solutionReadRepository, Comment comment, int solutionId, Login login, CancellationToken cancellationToken)
        {
            var solutionUserId = await solutionReadRepository.GetSolutionUserId(solutionId, cancellationToken);
            if(solutionUserId == 0)
                throw new SolutionNotFoundException();

            comment.CreateSolutionComment(solutionId);

            if (solutionUserId != comment.UserId)
                comment.AddDomainEvent(new SolutionCommentCreatedDomainEvent(comment,solutionUserId, login));

            foreach (var tag in comment.Tags)
                if (tag.UserId != comment.UserId && tag.UserId != solutionUserId)
                    comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, tag.UserId));
        }
    }
}
