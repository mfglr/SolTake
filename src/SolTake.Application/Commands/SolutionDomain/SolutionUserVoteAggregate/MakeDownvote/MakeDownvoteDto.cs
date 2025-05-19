using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeDownvote
{
    public record MakeDownvoteDto(int SolutionId) : IRequest<MakeDownvoteResponseDto>;
}
