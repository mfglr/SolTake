using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByParentId
{
    public record GetCommentsByParentIdDto(int ParentId, int? LastValue, int? Take) : IRequest<List<CommentResponseDto>>;
}
