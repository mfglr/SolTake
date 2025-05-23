using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetSolvedQuestionsByUserId
{
    public record GetSolvedQuestionsByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
