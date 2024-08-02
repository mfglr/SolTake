using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GerAllQuestions
{
    public record GetAllQuestionsDto(int? LastValue) : IRequest<List<QuestionResponseDto>>;
}
