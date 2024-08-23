using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetHomePageQuestions
{
    public class GetHomePageQuestionsDto(int? offset, int take, bool isDescending) : Pagination(offset,take,isDescending), IRequest<List<QuestionResponseDto>>;
}
