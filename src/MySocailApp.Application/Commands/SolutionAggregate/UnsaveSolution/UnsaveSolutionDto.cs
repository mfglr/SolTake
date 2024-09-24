using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.UnsaveSolution
{
    public record UnsaveSolutionDto(int SolutionId) : IRequest;
}
