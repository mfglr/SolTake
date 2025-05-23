using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetHomePageQuestions
{
    public record GetHomePageQuestionsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
