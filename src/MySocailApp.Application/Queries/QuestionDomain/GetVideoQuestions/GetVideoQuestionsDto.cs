using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.GetVideoQuestions
{
    public class GetVideoQuestionsDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>;

}
