using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetAllNotPublishedQuestions
{
    public record GetAllNotPublishedQuestionsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
