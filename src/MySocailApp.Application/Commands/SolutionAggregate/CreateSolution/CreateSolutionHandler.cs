using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public class CreateSolutionHandler(IUnitOfWork unitOfWork, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService, IMultimediaService multimediaService, IAccountAccessor accountAccessor, IUserReadRepository userReadRepository, SolutionCreatorDomainService solutionCreatorDomainService) : IRequestHandler<CreateSolutionDto, CreateSolutionResponseDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly SolutionCreatorDomainService _solutionCreatorDomainService = solutionCreatorDomainService;

        public async Task<CreateSolutionResponseDto> Handle(CreateSolutionDto request, CancellationToken cancellationToken)
        {
            IEnumerable<Multimedia> medias = [];
            try
            {
                var user = (await _userReadRepository.GetAsync(_accountAccessor.Account.Id, cancellationToken))!;

                //uploading images
                medias = await _multimediaService.UploadAsync(ContainerName.SolutionMedias, request.Images, cancellationToken);

                //create solution
                var solutionMedias = medias.Select(x => new SolutionMultimedia(x));
                var content = request.Content != null ? new SolutionContent(request.Content) : null;
                var solution = Solution.CreateByUser(request.QuestionId, _accountAccessor.Account.Id, content, solutionMedias);
                await _solutionCreatorDomainService.CreateAsync(solution, cancellationToken);
                await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return new(solution, _accountAccessor.Account, user);
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
