using MediatR;
using SolTake.Application.Commands.CommentDomain.CommentUserLikeAggregate.CreateCommentUserLike;

namespace SolTake.Application.Commands.CommentDomain.CommentUserLikeAggregate.LikeComment
{
    public record CreateCommentUserLikeDto(int CommentId) : IRequest<CreateCommentUserLikeResponseDto>;
}
