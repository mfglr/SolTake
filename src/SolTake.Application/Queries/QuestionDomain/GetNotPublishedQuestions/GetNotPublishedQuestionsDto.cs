using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetNotPublishedQuestions
{
    public record GetNotPublishedQuestionsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
