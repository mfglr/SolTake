using MediatR;

namespace SolTake.Application.Queries.SubjectAggregate.GetSubjectById
{
    public record GetSubjectByIdDto(int SubjectId) : IRequest<SubjectResponseDto>;
}
