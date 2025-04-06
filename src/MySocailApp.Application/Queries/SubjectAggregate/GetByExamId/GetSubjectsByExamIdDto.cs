using MediatR;

namespace MySocailApp.Application.Queries.SubjectAggregate.GetByExamId
{
    public record GetSubjectsByExamIdDto(int ExamId, int? Offset, int Take, bool IsDescending) : Core.Page(Offset, Take, IsDescending), IRequest<List<SubjectResponseDto>>;
}
