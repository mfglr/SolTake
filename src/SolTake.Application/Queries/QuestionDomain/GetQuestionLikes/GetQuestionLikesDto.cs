using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetQuestionLikes
{
    public record GetQuestionLikesDto(int QuestionId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionUserLikeResponseDto>>;
}
