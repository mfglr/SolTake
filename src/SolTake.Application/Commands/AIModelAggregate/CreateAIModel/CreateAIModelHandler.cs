using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Application.Commands.AIModelAggregate.CreateAIModel;
using SolTake.Core.AIModel;
using SolTake.Domain.AIModelAggregate.Abstracts;
using SolTake.Domain.AIModelAggregate.Entities;
using SolTake.Domain.AIModelAggregate.ValueObjects;

namespace SolTake.Application.Commands.AIModelAggregate.CreateAIModel
{
    public class CreateAIModelHandler(IMultimediaService multimediaService, IAIModelRepository aiModelRepository, IUnitOfWork unitOfWork, IAIModelCacheService aiModelCacheService) : IRequestHandler<CreateAIModelDto, CreateAIModelResponseDto>
    {
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IAIModelRepository _aiModelRepository = aiModelRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAIModelCacheService _aiModelCacheService = aiModelCacheService;

        public async Task<CreateAIModelResponseDto> Handle(CreateAIModelDto request, CancellationToken cancellationToken)
        {
            var name = new AIModelName(request.Name);
            var solPerInputToken = new Sol(request.SolPerInputToken);
            var solPerOutputToken = new Sol(request.SolPerOutputToken);
            var media = await _multimediaService.UploadAsync(ContainerName.AIModelMedias, request.Image, cancellationToken);
            var aiModel = new AIModel(name, solPerInputToken, solPerOutputToken, media, request.Commission);
            aiModel.Create();
            await _aiModelRepository.CreateAsync(aiModel, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            _aiModelCacheService.Add(aiModel);

            return new(aiModel);
        }
    }
}
