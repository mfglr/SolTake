using MediatR;

namespace SolTake.Application.Commands.ExamAggregate.Create
{
    public record CreateExamDto(string ShortName, string FullName) : IRequest<CreateExamResponseDto>;
}
