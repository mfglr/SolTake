using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(SolutionCreatorDomainService solutionCreator, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, IImageService blobService, ISolutionQueryRepository solutionQueryRepository) : IRequestHandler<CreateSolutionDto, SolutionResponseDto>
    {
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IImageService _blobService = blobService;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;

        public async Task<SolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            var userId = _tokenReader.GetRequiredAccountId();
            var images = (await _blobService.UploadAsync(ContainerName.SolutionImages, request.Images, cancellationToken)).Select(x => SolutionImage.Create(x.BlobName, x.Dimention.Height, x.Dimention.Width));
            var content = new SolutionContent(request.Content ?? "");
            var solution = new Solution(content,images);
            await _solutionCreator.CreateAsync(solution, userId, request.QuestionId,cancellationToken);
            
            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _solutionQueryRepository.GetByIdAsync(userId, solution.Id, cancellationToken))!;
        }
    }
}
