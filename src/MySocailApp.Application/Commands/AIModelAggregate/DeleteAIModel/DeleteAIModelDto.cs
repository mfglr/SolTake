using MediatR;

namespace MySocailApp.Application.Commands.AIModelAggregate.DeleteAIModel
{
    public record DeleteAIModelDto(int Id) : IRequest;
}
