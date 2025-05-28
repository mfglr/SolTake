using MediatR;

namespace SolTake.Application.Commands.PurchaseAggregate.CreatePurchase
{
    public record CreatePurchaseDto(string Token, string ProductId) : IRequest;
}
