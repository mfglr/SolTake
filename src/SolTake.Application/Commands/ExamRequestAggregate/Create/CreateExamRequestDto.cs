using MediatR;

namespace SolTake.Application.Commands.ExamRequestAggregate.Create
{
    public record CreateExamRequestDto(string Name, string Initialism) : IRequest<CreateExamRequestResponseDto>;
}
