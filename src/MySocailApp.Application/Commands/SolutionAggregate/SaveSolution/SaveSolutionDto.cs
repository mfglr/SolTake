using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.SaveSolution
{
    public record SaveSolutionDto(int SolutionId) : IRequest<SaveSolutionCommandResponseDto>;
}
