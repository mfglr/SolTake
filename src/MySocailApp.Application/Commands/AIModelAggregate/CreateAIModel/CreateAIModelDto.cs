using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.AIModelAggregate.CreateAIModel
{
    public record CreateAIModelDto(string Name, int SolPerInputToken, int SolPerOutputToken, double Commission, IFormFile Image) : IRequest<CreateAIModelResponseDto>;
}
