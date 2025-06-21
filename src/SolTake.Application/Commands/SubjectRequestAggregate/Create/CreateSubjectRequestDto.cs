using MediatR;

namespace SolTake.Application.Commands.SubjectRequestAggregate.Create
{
    public record CreateSubjectRequestDto(int ExamId, string Name) : IRequest<CreateSubjectRequestResponseDto>;
}
