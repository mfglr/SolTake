using MediatR;
using Microsoft.AspNetCore.Http;
using SolTake.Application.Commands.AIModelAggregate.CreateAIModel;

namespace SolTake.Application.Commands.AIModelAggregate.CreateAIModel
{
    public record CreateAIModelDto(string Name, int SolPerInputToken, int SolPerOutputToken, double Commission, IFormFile Image) : IRequest<CreateAIModelResponseDto>;
}
