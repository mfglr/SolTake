using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.AIModelAggregate.Abstracts;
using SolTake.Domain.AIModelAggregate.Exceptions;

namespace SolTake.Application.Commands.AIModelAggregate.UpdateAIModelCommission
{
    public class UpdatreAIModelCommissionHandler(IAIModelRepository aiModelRepository, IAIModelCacheService aiModelCacheService, IUnitOfWork unitOfWork) : IRequestHandler<UpdateAIModelCommissionDto>
    {
        private readonly IAIModelRepository _aiModelRepository = aiModelRepository;
        private readonly IAIModelCacheService _aiModelCacheService = aiModelCacheService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UpdateAIModelCommissionDto request, CancellationToken cancellationToken)
        {
            var model =
                await _aiModelRepository.GetAsync(request.Id, cancellationToken) ??
                throw new AIModelNotFoundException();
            model.UpdateCommision(request.Commission);
            await _unitOfWork.CommitAsync(cancellationToken);
            _aiModelCacheService.Models.First(x => x.Id == request.Id).UpdateCommision(request.Commission);
        }
    }
}
