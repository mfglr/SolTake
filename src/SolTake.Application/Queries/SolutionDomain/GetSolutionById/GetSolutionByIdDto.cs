using MediatR;

namespace SolTake.Application.Queries.SolutionDomain.GetSolutionById
{
    public record GetSolutionByIdDto(int SolutionId) : IRequest<SolutionResponseDto>;
}
