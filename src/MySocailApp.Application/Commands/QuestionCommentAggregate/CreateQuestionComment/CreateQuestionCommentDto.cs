using MediatR;
using MySocailApp.Application.Queries.QuestionCommentAggregate;

namespace MySocailApp.Application.Commands.QuestionCommentAggregate.CreateQuestionComment
{
    public record CreateQuestionCommentDto(int QuestionId,string Content) : IRequest<QuestionCommentResponseDto>;
}
