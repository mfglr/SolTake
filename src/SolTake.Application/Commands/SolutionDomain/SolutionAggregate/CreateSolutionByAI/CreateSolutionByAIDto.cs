using MediatR;
using Microsoft.AspNetCore.Http;

namespace SolTake.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI
{
    public record CreateSolutionByAIDto(string Model, int QuestionId, IFormFile? File, string Prompt) : IRequest<CreateSolutionByAIResponseDto>;
}
