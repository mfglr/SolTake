using MediatR;
using Microsoft.AspNetCore.Http;
using SolTake.Core;

namespace MySocailApp.Application.Commands.AIModelAggregate.UpdateAIModelImage
{
    public record UpdateAIModelImageDto(int Id, IFormFile Image) : IRequest<Multimedia>;
}
