using MediatR;
using MySocailApp.Application.Queries.CommentAggregate;

namespace MySocailApp.Application.Commands.CommentAggregate.Create
{
    public record CreateCommentDto(string Content, int? QuestionId, int? SolutionId, int? ParentId) : IRequest<CommentResponseDto>;
}
