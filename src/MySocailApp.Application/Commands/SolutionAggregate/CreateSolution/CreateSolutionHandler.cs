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
    public class CreateSolutionHandler(SolutionCreatorDomainService solutionCreator, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, ISolutionQueryRepository solutionQueryRepository, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService, IMultimedyaService multimediaService) : IRequestHandler<CreateSolutionDto, SolutionResponseDto>
    {
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IBlobService _blobService = blobService;
        private readonly IMultimedyaService _multimediaService = multimediaService;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;

        public async Task<SolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            IEnumerable<SolutionMultimedia> medias = [];
            try
            {
                //uploading images
                medias = (await _multimediaService.UploadAsync(ContainerName.SolutionMedias, request.Images, cancellationToken)).Select(x => new SolutionMultimedia(x));

                //create solution
                var userId = _tokenReader.GetRequiredAccountId();
                var content = new SolutionContent(request.Content ?? "");
                var solution = new Solution(request.QuestionId, userId, content, medias);
                await _solutionCreator.CreateAsync(solution, cancellationToken);
                await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return (await _solutionQueryRepository.GetByIdAsync(userId, solution.Id, cancellationToken))!;
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
