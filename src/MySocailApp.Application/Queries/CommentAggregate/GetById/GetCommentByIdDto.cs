using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetById
{
    public record GetCommentByIdDto(int Id) : IRequest<CommentResponseDto>; 
}
