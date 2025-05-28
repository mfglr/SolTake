namespace SolTake.Domain.PurchaseAggregate.Abstracts
{
    public interface IPurchaseValidator
    {
        Task ValidateAsync(string token, CancellationToken cancellationToken);
    }
}
