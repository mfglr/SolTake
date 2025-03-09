using MediatR;
using MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.CreateCommentUserLike;

namespace MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.LikeComment
{
    public record CreateCommentUserLikeDto(int Id) : IRequest<CreateCommentUserLikeResponseDto>;
}
