using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetRejecetedQuestions
{
    public record GetRejectedQuestionsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
