using MediatR;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI
{
    public record CreateSolutionByAIDto(string Model, int QuestionId, string? BlobName, double? Duration, string? Prompt, bool IsHighResulation) : IRequest<CreateSolutionResponseDto>;
}
