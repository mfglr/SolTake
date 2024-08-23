using MediatR;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentLikes
{
    public class GetCommentLikesDto(int commentId,int? offset,int take,bool isDescending) : Pagination(offset,take,isDescending), IRequest<List<AppUserResponseDto>>
    {
        public int CommentId { get; private set; } = commentId;
    }
}
