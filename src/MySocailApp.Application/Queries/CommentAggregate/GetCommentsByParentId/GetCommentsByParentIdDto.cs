using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByParentId
{
    public record GetCommentsByParentIdDto(int ParentId, int? LastValue, int? Take, bool IsDescending) : IRequest<List<CommentResponseDto>>;
}
