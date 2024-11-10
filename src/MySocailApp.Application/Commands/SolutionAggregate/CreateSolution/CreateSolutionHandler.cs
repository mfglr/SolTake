using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(SolutionCreatorDomainService solutionCreator, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, IImageService imageService, ISolutionQueryRepository solutionQueryRepository, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService) : IRequestHandler<CreateSolutionDto, SolutionResponseDto>
    {
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IImageService _imageService = imageService;
        private readonly IBlobService _blobService = blobService;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;

        public async Task<SolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            List<AppImage>? appImages = null;
            try
            {
                //uploading images
                appImages = await _imageService.UploadAsync(ContainerName.SolutionImages, request.Images, cancellationToken);

                //create solution 
                var images = appImages.Select(x => SolutionImage.Create(x.BlobName, x.Dimention.Height, x.Dimention.Width));
                var userId = _tokenReader.GetRequiredAccountId();
                var content = new SolutionContent(request.Content ?? "");
                var solution = new Solution(request.QuestionId, userId, content, images);
                await _solutionCreator.CreateAsync(solution, cancellationToken);
                await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return (await _solutionQueryRepository.GetByIdAsync(userId, solution.Id, cancellationToken))!;
            }
            catch (Exception)
            {
                if (appImages != null)
                    foreach (var appImage in appImages)
                        await _blobService.DeleteAsync(appImage.ContainerName, appImage.BlobName, cancellationToken);
                throw;
            }
        }
    }
}
