using MediatR;

namespace SolTake.Application.Commands.CommentDomain.CommentAggregate.DeleteComment
{
    public record DeleteCommentDto(int CommentId) : IRequest;
}
