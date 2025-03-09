using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(IUnitOfWork unitOfWork, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService, IMultimediaService multimediaService, IUserAccessor userAccessor, SolutionCreatorDomainService solutionCreatorDomainService) : IRequestHandler<CreateSolutionDto, CreateSolutionResponseDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly SolutionCreatorDomainService _solutionCreatorDomainService = solutionCreatorDomainService;

        public async Task<CreateSolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            IEnumerable<Multimedia> medias = [];
            try
            {
                //uploading images
                medias = await _multimediaService.UploadAsync(ContainerName.SolutionMedias, request.Images, cancellationToken);

                //create solution
                var solutionMedias = medias.Select(x => new SolutionMultimedia(x));
                var content = request.Content != null ? new SolutionContent(request.Content) : null;
                var solution = Solution.CreateByUser(request.QuestionId, _userAccessor.User.Id, content, solutionMedias);
                await _solutionCreatorDomainService.CreateAsync(solution, cancellationToken);
                await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return new(solution, _userAccessor.User);
            }
            catch (Exception)
            {
                foreach (var media in medias)
                    await _blobService.DeleteAsync(ContainerName.SolutionMedias, media.BlobName, cancellationToken);
                throw;
            }
        }
    }
}
