using MediatR;

namespace SolTake.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI
{
    public record CreateSolutionByAIDto(int ModelId, int QuestionId, string Prompt, string? BlobName, int PositionMs) : IRequest<CreateSolutionByAIResponseDto>;
}
