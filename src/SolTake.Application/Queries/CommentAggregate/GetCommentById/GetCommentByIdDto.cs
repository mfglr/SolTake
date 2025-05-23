using MediatR;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentById
{
    public record GetCommentByIdDto(int Id) : IRequest<CommentResponseDto>;
}
