using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetQuestionsByUserId
{
    public record GetQuestionsByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
