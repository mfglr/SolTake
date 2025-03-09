using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeUpvote
{
    public record MakeUpvoteDto(int SolutionId) : IRequest<MakeUpvoteResponseDto>;
}
