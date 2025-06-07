namespace SolTake.Application.Commands.PurchaseAggregate.CreatePurchase
{
    public record PubSubMessage(string Data, string MessageId, string PublishTime);
}
