using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.CommentAggregate.DomainServices.InternalDomainServices
{
    internal static class SolutionCommentCreatorDomainService
    {
        public static async Task CreateAsync(ISolutionReadRepository solutionReadRepository, Comment comment, int solutionId, CancellationToken cancellationToken)
        {
            var solution =
                    await solutionReadRepository.GetAsync((int)solutionId, cancellationToken) ??
                    throw new SolutionNotFoundException();

            comment.CreateSolutionComment(solution.Id);

            if (solution.UserId != comment.AppUserId)
                comment.AddDomainEvent(new SolutionCommentCreatedDomainEvent(solution, comment));

            foreach (var tag in comment.Tags)
                if (tag.UserId != comment.AppUserId && tag.UserId != solution.UserId)
                    comment.AddDomainEvent(new UserTaggedInCommentDomainEvent(comment, tag.UserId));
        }
    }
}
