using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId
{
    public class GetCommentsBySolutionIdDto(int solutionId, int offset,int take,bool isDescending) : Page(offset,take,isDescending), IRequest<List<CommentResponseDto>>
    {
        public int SolutionId { get; private set; } = solutionId;
    }
}
