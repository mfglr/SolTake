using MediatR;

namespace MySocailApp.Application.Commands.CommentDomain.CommentAggregate.DeleteComment
{
    public record DeleteCommentDto(int CommentId) : IRequest;
}
