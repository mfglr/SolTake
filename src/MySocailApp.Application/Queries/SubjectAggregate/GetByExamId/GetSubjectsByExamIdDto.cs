using MediatR;

namespace MySocailApp.Application.Queries.SubjectAggregate.GetByExamId
{
    public record GetSubjectsByExamIdDto(int ExamId) : IRequest<List<SubjectResponseDto>>;
}
