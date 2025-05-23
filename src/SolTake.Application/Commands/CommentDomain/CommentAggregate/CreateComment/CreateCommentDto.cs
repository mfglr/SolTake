using MediatR;
using SolTake.Application.Queries.CommentAggregate;

namespace SolTake.Application.Commands.CommentDomain.CommentAggregate.CreateComment
{
    public record CreateCommentDto(string Content, int? QuestionId, int? SolutionId, int? RepliedId) : IRequest<CommentResponseDto>;
}
