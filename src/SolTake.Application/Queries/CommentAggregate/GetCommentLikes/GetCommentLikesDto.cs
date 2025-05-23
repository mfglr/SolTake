using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentLikes
{
    public record GetCommentLikesDto(int CommentId,int? Offset,int Take,bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<CommentUserLikeResponseDto>>;
}
