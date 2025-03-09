using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.GetHomePageQuestions
{
    public class GetHomePageQuestionsDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>;
}
