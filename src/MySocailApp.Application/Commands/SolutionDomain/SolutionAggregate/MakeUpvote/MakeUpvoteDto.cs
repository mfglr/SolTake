using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MakeUpvote
{
    public record MakeUpvoteDto(int SolutionId) : IRequest<MakeUpvoteCommandResponseDto>;
}
