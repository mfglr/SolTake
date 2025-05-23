using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentsBySolutionId
{
    public record GetCommentsBySolutionIdDto(int SolutionId, int? Offset,int Take,bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<CommentResponseDto>>;
}
