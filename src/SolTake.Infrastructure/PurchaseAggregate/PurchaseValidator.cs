using Google.Apis.AndroidPublisher.v3;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using SolTake.Domain.BalanceAggregate.Exceptions;
using SolTake.Domain.PurchaseAggregate.Abstracts;

namespace SolTake.Infrastructure.PurchaseAggregate
{
    public class PurchaseValidator : IPurchaseValidator
    {
        private readonly static string _credentialJsonFilePath = "soltake-438017-b527a2553353.json";

        public async Task ValidateAsync(string token, CancellationToken cancellationToken)
        {
            GoogleCredential credential;
            using var stream = new FileStream(_credentialJsonFilePath, FileMode.Open, FileAccess.Read);
            credential = GoogleCredential.FromStream(stream).CreateScoped(AndroidPublisherService.Scope.Androidpublisher);

            var service = new AndroidPublisherService(new BaseClientService.Initializer
            {
                HttpClientInitializer = credential,
                ApplicationName = "soltake"
            });

            var purchase = service.Purchases.Products.Get("com.soltake", "soltake_test", token);
            var result = await purchase.ExecuteAsync(cancellationToken);

            if (result.PurchaseState != 0 || result.ConsumptionState != 0)
                throw new InvalidPurchase();
        }
    }
}
