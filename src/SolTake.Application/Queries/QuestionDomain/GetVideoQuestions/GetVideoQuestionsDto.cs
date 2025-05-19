using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.GetVideoQuestions
{
    public record GetVideoQuestionsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;

}
