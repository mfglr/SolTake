using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave
{
    public record CreateSolutionUserSaveDto(int SolutionId) : IRequest<CreateSolutionUserSaveResponseDto>;
}
