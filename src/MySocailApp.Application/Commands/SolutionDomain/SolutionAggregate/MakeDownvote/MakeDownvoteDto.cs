using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MakeDownvote
{
    public record MakeDownvoteDto(int SolutionId) : IRequest<MakeDownvoteCommandResponseDto>;
}
