using MediatR;

namespace MySocailApp.Application.Queries.QuestionCommentAggregate.GetQuestionCommentById
{
    public record GetQuestionCommentByIdDto(int Id) : IRequest<QuestionCommentResponseDto>; 
}
