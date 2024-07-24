using MediatR;

namespace MySocailApp.Application.Queries.QuestionCommentAggregate.GetQuestionCommentsByQuestionId
{
    public record GetQuestionCommentsByQuestionIdDto(int QuestionId,int? LastId) : IRequest<List<QuestionCommentResponseDto>>;
}
