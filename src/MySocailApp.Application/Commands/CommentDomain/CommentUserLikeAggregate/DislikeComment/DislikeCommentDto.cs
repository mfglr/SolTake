using MediatR;

namespace MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.DislikeComment
{
    public record DislikeCommentDto(int CommentId) : IRequest;
}
