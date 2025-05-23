using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetUnsolvedQuestionsByUserId
{
    public record GetUnsolvedQuestionsByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
