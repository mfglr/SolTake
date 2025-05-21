using MediatR;

namespace SolTake.Application.Commands.AIModelAggregate.DeleteAIModel
{
    public record DeleteAIModelDto(int Id) : IRequest;
}
