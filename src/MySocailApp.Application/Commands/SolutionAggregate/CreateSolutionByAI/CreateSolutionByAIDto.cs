using MediatR;
using MySocailApp.Application.Commands.SolutionAggregate.CreateSolution;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolutionByAI
{
    public record CreateSolutionByAIDto(string Model,int QuestionId) : IRequest<CreateSolutionResponseDto>;
}
