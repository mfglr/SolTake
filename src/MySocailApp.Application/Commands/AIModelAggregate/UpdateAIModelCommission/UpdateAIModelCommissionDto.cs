using MediatR;

namespace MySocailApp.Application.Commands.AIModelAggregate.UpdateAIModelCommission
{
    public record UpdateAIModelCommissionDto(int Id, double Commission) : IRequest;
}
