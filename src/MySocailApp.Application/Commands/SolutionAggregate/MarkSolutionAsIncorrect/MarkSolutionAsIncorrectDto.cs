using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.MarkSolutionAsIncorrect
{
    public record MarkSolutionAsIncorrectDto(int SolutionId) : IRequest;
}
