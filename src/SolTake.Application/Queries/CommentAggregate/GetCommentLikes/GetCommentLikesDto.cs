using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentLikes
{
    public record GetCommentLikesDto(int CommentId,int? Offset,int Take,bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<CommentUserLikeResponseDto>>;
}
