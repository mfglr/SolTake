namespace SolTake.Application.Commands.PurchaseAggregate.CreatePurchase
{
    public record SubscriptionNotification(int NotificationType, string PurchaseToken, string SubscriptionId);
}
