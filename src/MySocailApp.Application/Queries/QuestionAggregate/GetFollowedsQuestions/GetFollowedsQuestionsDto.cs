using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetFollowedsQuestions
{
    public class GetFollowedsQuestionsDto(int Offset, int Take, bool IsDescending) : Core.Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
