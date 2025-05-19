using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsIncorrect
{
    public record MarkSolutionAsIncorrectDto(int SolutionId) : IRequest;
}
