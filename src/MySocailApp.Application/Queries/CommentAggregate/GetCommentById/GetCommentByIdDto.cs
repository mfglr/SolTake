using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentById
{
    public record GetCommentByIdDto(int Id) : IRequest<CommentResponseDto>;
}
