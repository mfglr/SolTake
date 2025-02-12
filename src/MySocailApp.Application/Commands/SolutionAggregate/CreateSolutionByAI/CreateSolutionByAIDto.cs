using MediatR;
using MySocailApp.Application.Commands.SolutionAggregate.CreateSolution;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolutionByAI
{
    public record CreateSolutionByAIDto(string Model,int QuestionId,string? BlobName,double? Duration, string? Prompt) : IRequest<CreateSolutionResponseDto>;
}
