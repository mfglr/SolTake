using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetHomePageQuestions
{
    public record GetHomePageQuestionsDto(int? LastValue, int? Take, bool IsDescending) : IRequest<List<QuestionResponseDto>>;
}
