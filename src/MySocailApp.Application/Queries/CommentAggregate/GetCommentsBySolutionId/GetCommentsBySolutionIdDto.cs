using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId
{
    public record GetCommentsBySolutionIdDto(int SolutionId,int? LastId) : IRequest<List<CommentResponseDto>>;
}
