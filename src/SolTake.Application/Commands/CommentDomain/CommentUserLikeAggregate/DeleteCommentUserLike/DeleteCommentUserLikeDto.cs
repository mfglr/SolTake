using MediatR;

namespace SolTake.Application.Commands.CommentDomain.CommentUserLikeAggregate.DeleteCommentUserLike
{
    public record DeleteCommentUserLikeDto(int CommentId) : IRequest;
}
