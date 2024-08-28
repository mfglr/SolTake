using MediatR;

namespace MySocailApp.Application.Commands.CommentAggregate.DislikeComment
{
    public record DislikeCommentDto(int CommentId) : IRequest;
}
