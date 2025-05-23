using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetVideoQuestions
{
    public record GetVideoQuestionsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;

}
