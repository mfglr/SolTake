using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.MarkSolutionAsCorrect
{
    public record MarkSolutionAsCorrectDto(int SolutionId) : IRequest;
}
