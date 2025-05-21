using MediatR;
using Microsoft.AspNetCore.Http;
using SolTake.Core;

namespace SolTake.Application.Commands.AIModelAggregate.UpdateAIModelImage
{
    public record UpdateAIModelImageDto(int Id, IFormFile Image) : IRequest<Multimedia>;
}
