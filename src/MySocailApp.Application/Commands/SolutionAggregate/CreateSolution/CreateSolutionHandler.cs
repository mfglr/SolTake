using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(SolutionCreatorDomainService solutionCreator, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, IImageService blobService, ISolutionQueryRepository solutionQueryRepository, ISolutionWriteRepository solutionWriteRepository) : IRequestHandler<CreateSolutionDto, SolutionResponseDto>
    {
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IImageService _blobService = blobService;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;

        public async Task<SolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            //start uploading images 
            var images = (await _blobService.UploadAsync(ContainerName.SolutionImages, request.Images, cancellationToken)).Select(x => SolutionImage.Create(x.BlobName, x.Dimention.Height, x.Dimention.Width));
            //end of uploading image

            var userId = _tokenReader.GetRequiredAccountId();
            var content = new SolutionContent(request.Content ?? "");
            var solution = new Solution(request.QuestionId, userId, content, images);
            
            await _solutionCreator.CreateAsync(solution, cancellationToken);
            await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _solutionQueryRepository.GetByIdAsync(userId, solution.Id, cancellationToken))!;
        }
    }
}
