using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.DomainServices.InternalDomainServices
{
    internal static class SolutionCommentCreatorDomainService
    {
        public static async Task CreateAsync(ISolutionReadRepository solutionReadRepository, Comment comment, int solutionId, CancellationToken cancellationToken)
        {
            var solution =
                    await solutionReadRepository.GetAsync(solutionId, cancellationToken) ??
                    throw new SolutionNotFoundException();

            comment.CreateSolutionComment(solution.Id);

            if (solution.UserId != comment.UserId)
                comment.AddDomainEvent(new SolutionCommentCreatedDomainEvent(solution, comment));

            foreach (var tag in comment.Tags)
                if (tag.UserId != comment.UserId && tag.UserId != solution.UserId)
                    comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, tag.UserId));
        }
    }
}
