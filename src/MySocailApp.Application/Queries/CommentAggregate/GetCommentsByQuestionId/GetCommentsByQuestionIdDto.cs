using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByQuestionId
{
    public record GetCommentsByQuestionIdDto(int QuestionId, int? LastValue, int? Take) : IRequest<List<CommentResponseDto>>;
}
