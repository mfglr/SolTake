using MediatR;

namespace MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.DeleteCommentUserLike
{
    public record DeleteCommentUserLikeDto(int CommentId) : IRequest;
}
