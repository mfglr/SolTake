using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsCorrect
{
    public record MarkSolutionAsCorrectDto(int SolutionId) : IRequest;
}
