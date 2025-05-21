using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Core;
using SolTake.Domain.AIModelAggregate.Abstracts;
using SolTake.Domain.AIModelAggregate.Exceptions;

namespace SolTake.Application.Commands.AIModelAggregate.UpdateAIModelImage
{
    public class UpdateAIModelImageHandler(IMultimediaService multimediaService, IAIModelRepository aiModelRepository, IAIModelCacheService aiModelCacheService, IUnitOfWork unitOfWork, IBlobService blobService) : IRequestHandler<UpdateAIModelImageDto, Multimedia>
    {
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IAIModelRepository _aiModelRepository = aiModelRepository;
        private readonly IAIModelCacheService _aiModelCacheService = aiModelCacheService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;

        public async Task<Multimedia> Handle(UpdateAIModelImageDto request, CancellationToken cancellationToken)
        {

            var image = await _multimediaService.UploadAsync(ContainerName.AIModelMedias, request.Image, cancellationToken);

            try
            {
                var model = 
                    await _aiModelRepository.GetAsync(request.Id, cancellationToken) ??
                    throw new AIModelNotFoundException();

                model.UpdateImage(image);
                await _unitOfWork.CommitAsync(cancellationToken);

                var cachedAIModel = _aiModelCacheService.Models.First(x => x.Id == request.Id);
                cachedAIModel.UpdateImage(image);

                return image;
            }
            catch (Exception)
            {
                await _blobService.DeleteAsync(image.ContainerName,image.BlobName, cancellationToken);
                throw;
            }

        }
    }
}
