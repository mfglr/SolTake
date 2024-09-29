using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Queries.SolutionAggregate;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateVideoSolution
{
    public record CreateVideoSolutionDto(int QuestionId, IFormFile File, string? Content) : IRequest<SolutionResponseDto>;
}
