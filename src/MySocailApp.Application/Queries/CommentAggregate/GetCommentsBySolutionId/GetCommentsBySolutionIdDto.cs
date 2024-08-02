using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId
{
    public record GetCommentsBySolutionIdDto(int SolutionId,int? LastValue) : IRequest<List<CommentResponseDto>>;
}
