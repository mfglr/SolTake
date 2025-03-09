using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.RemoveUpvote
{
    public record RemoveUpvoteDto(int SolutionId) : IRequest;
}
