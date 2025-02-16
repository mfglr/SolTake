using MediatR;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetVideoQuestions
{
    public class GetVideoQuestionsDto(int offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>;

}
