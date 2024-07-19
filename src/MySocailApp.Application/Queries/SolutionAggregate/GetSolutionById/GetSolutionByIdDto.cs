using MediatR;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionById
{
    public record GetSolutionByIdDto(int SolutionId) : IRequest<SolutionResponseDto>;
}
