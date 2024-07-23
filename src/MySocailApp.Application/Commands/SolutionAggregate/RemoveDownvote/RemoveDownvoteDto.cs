using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.RemoveDownvote
{
    public record RemoveDownvoteDto(int solutionId) : IRequest;
}
