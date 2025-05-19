using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByParentId
{
    public record GetCommentsByParentIdDto(int ParentId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<CommentResponseDto>>;
}
