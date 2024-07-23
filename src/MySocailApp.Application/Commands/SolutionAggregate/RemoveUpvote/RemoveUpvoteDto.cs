using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.RemoveUpvote
{
    public record RemoveUpvoteDto(int SolutionId) : IRequest;
}
