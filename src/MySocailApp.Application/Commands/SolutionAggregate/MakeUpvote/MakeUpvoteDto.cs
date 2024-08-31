using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.MakeUpvote
{
    public record MakeUpvoteDto(int SolutionId) : IRequest<MakeUpvoteCommandResponseDto>;
}
