using MediatR;
using MySocailApp.Application.Queries.SolutionDomain;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSolutionById
{
    public record GetSolutionByIdDto(int SolutionId) : IRequest<SolutionResponseDto>;
}
