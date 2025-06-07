using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.PurchaseAggregate.Abstracts;
using SolTake.Domain.PurchaseAggregate.DomainServices;
using SolTake.Domain.PurchaseAggregate.Entities;

namespace SolTake.Application.Commands.PurchaseAggregate.CreatePurchase
{
    public class CreatePurchaseHandler(IPurchaseRepository purchaseRepository, IPurchaseValidator purchaseValidator, IUnitOfWork unitOfWork, PurchaseCreatorDomainService purchaseCreatorDomainService, IAccessTokenReader accessTokenReader) : IRequestHandler<CreatePurchaseDto>
    {
        private readonly IPurchaseRepository _purchaseRepository = purchaseRepository;
        private readonly IPurchaseValidator _purchaseValidator = purchaseValidator;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly PurchaseCreatorDomainService _purchaseCreatorDomainService = purchaseCreatorDomainService;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(CreatePurchaseDto request, CancellationToken cancellationToken)
        {
            await _purchaseValidator.ValidateAsync(request.Token,request.ProductId,cancellationToken);
            var purchase = new Purchase(_accessTokenReader.GetRequiredAccountId(),request.Token,request.ProductId);

            await _purchaseCreatorDomainService.CreateAsync(purchase, cancellationToken);
            await _purchaseRepository.CreateAsync(purchase, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
