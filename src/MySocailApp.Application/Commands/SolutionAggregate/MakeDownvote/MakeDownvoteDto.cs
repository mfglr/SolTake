using MediatR;

namespace MySocailApp.Application.Commands.SolutionAggregate.MakeDownvote
{
    public record MakeDownvoteDto(int SolutionId) : IRequest<MakeDownvoteCommandResponseDto>;
}
