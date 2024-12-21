using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public record CreateSolutionDto(string? Content,int QuestionId,IFormFileCollection Images): IRequest<CreateSolutionResponseDto>;
}
