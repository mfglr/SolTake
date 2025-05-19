using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution
{
    public record CreateSolutionDto(string? Content, int QuestionId, IFormFileCollection Images) : IRequest<CreateSolutionResponseDto>;
}
