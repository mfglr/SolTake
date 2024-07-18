using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Queries.SolutionAggregate;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public record CreateSolutionDto(string? Content,int QuestionId,IFormFileCollection Images): IRequest<SolutionResponseDto>;
}
