using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId
{
    public record GetCommentsBySolutionIdDto(int SolutionId, int? Offset,int Take,bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<CommentResponseDto>>;
}
