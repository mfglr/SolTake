using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GerAllQuestions
{
    public record GetAllQuestionsDto(int? LastId) : IRequest<List<QuestionResponseDto>>;
}
