using MediatR;
using MySocailApp.Application.Queries.CommentAggregate;

namespace MySocailApp.Application.Commands.CommentAggregate.LikeComment
{
    public record LikeCommentDto(int Id) : IRequest<CommentUserLikeResponseDto>;
}
