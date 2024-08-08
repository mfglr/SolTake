using MediatR;
using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentLikes
{
    public record GetCommentLikesDto(int CommentId,int? LastValue,int? Take) : IRequest<List<AppUserResponseDto>>;
}
