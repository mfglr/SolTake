using MediatR;

namespace SolTake.Application.Commands.AIModelAggregate.UpdateAIModelCommission
{
    public record UpdateAIModelCommissionDto(int Id, double Commission) : IRequest;
}
