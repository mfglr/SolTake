namespace SolTake.Application.Commands.PurchaseAggregate.CreatePurchase
{
    public record OneTimeProductNotification(int NotificationType, string PurchaseToken, string Sku);
}
