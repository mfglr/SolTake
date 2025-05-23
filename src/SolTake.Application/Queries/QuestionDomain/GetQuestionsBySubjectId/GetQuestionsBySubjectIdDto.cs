using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetQuestionsBySubjectId
{
    public record GetQuestionsBySubjectIdDto(int SubjectId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
