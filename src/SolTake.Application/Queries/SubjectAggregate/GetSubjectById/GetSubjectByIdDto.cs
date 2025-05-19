using MediatR;

namespace MySocailApp.Application.Queries.SubjectAggregate.GetSubjectById
{
    public record GetSubjectByIdDto(int SubjectId) : IRequest<SubjectResponseDto>;
}
