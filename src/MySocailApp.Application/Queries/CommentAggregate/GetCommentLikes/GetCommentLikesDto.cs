using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentLikes
{
    public class GetCommentLikesDto(int commentId,int? offset,int take,bool isDescending) : Page(offset,take,isDescending), IRequest<List<CommentUserLikeResponseDto>>
    {
        public int CommentId { get; private set; } = commentId;
    }
}
