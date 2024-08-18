using MediatR;

namespace MySocailApp.Application.Commands.CommentAggregate.DeleteComment
{
    public record DeleteCommentDto(int CommentId) : IRequest;
}
