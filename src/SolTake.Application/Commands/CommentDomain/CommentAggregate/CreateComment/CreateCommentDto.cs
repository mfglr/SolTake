using MediatR;
using MySocailApp.Application.Queries.CommentAggregate;

namespace MySocailApp.Application.Commands.CommentDomain.CommentAggregate.CreateComment
{
    public record CreateCommentDto(string Content, int? QuestionId, int? SolutionId, int? RepliedId) : IRequest<CommentResponseDto>;
}
