using Google.Apis.AndroidPublisher.v3;
using Google.Apis.AndroidPublisher.v3.Data;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using SolTake.Domain.PurchaseAggregate.Abstracts;
using SolTake.Domain.PurchaseAggregate.Exceptions;

namespace SolTake.Infrastructure.PurchaseAggregate
{
    public class PurchaseValidator : IPurchaseValidator
    {
        private readonly static string _credentialJsonFilePath = "soltake-438017-ff80296e9944.json";

        public async Task ValidateAsync(string token, string productId, CancellationToken cancellationToken)
        {
            GoogleCredential credential;
            using var stream = new FileStream(_credentialJsonFilePath, FileMode.Open, FileAccess.Read);
            credential = GoogleCredential.FromStream(stream).CreateScoped(AndroidPublisherService.Scope.Androidpublisher);

            var service = new AndroidPublisherService(new BaseClientService.Initializer
            {
                HttpClientInitializer = credential,
                ApplicationName = "soltake"
            });

            var purchase = service.Purchases.Products.Get("com.soltake", productId, token);
            ProductPurchase result;
            try
            {
                result = await purchase.ExecuteAsync(cancellationToken);
            }
            catch(Exception)
            {
                throw new PurchaseNotValidatedException();
            }

            if (result.PurchaseState != 0)
                throw new InvalidPurchaseState();
        }
    }
}
