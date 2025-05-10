using MediatR;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI
{
    public record CreateSolutionByAIDto(int ModelId, int QuestionId, string? BlobName, double? Duration, string? Prompt, bool IsHighResulation) : IRequest<CreateSolutionByAIResponseDto>;
}
