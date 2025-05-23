using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave
{
    public record CreateSolutionUserSaveDto(int SolutionId) : IRequest<CreateSolutionUserSaveResponseDto>;
}
