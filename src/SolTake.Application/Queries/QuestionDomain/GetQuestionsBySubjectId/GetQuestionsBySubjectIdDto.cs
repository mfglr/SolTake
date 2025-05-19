using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.GetQuestionsBySubjectId
{
    public record GetQuestionsBySubjectIdDto(int SubjectId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
