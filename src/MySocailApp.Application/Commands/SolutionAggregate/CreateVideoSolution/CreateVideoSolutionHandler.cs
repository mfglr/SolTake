using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateVideoSolution
{
    public class CreateVideoSolutionHandler(IUnitOfWork unitOfWork,SolutionCreatorDomainService solutionCreator, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService, IMultimediaService multimediaService, IAccountAccessor accountAccessor) : IRequestHandler<CreateVideoSolutionDto, CreateVideoSolutionResponseDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IBlobService _blobService = blobService;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMultimediaService _multimediaService = multimediaService;

        public async Task<CreateVideoSolutionResponseDto> Handle(CreateVideoSolutionDto request, CancellationToken cancellationToken)
        {
            Multimedia? media = null;
            try
            {
                //upload video
                media = await _multimediaService.UploadAsync(ContainerName.SolutionMedias, request.File, cancellationToken);

                //create solution
                var video = new SolutionMultimedia(media);
                var userId = _accountAccessor.Account.Id;
                var content = request.Content != null ? new SolutionContent(request.Content) : null;
                var solution = new Solution(request.QuestionId, userId, content, video);
                await _solutionCreator.CreateAsync(solution, cancellationToken);
                await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return new (solution, _accountAccessor.Account);
            }
            catch (Exception)
            {
                if (media != null)
                    await _blobService.DeleteAsync(ContainerName.SolutionMedias, media.BlobName, cancellationToken);
                throw;
            }
        }
    }
}
