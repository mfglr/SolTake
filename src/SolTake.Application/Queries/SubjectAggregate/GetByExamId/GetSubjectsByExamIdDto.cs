using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.SubjectAggregate.GetByExamId
{
    public record GetSubjectsByExamIdDto(int ExamId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SubjectResponseDto>>;
}
