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

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateVideoSolution
{
    public class CreateVideoSolutionHandler(ISolutionQueryRepository solutionQueryRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IVideoService videoService, SolutionCreatorDomainService solutionCreator, ISolutionWriteRepository solutionWriteRepository, IBlobService blobService) : IRequestHandler<CreateVideoSolutionDto, SolutionResponseDto>
    {
        private readonly IVideoService _videoService = videoService;
        private readonly IBlobService _blobService = blobService;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<SolutionResponseDto> Handle(CreateVideoSolutionDto request, CancellationToken cancellationToken)
        {

            AppVideo? appVideo = null;
            try
            {
                //upload video
                appVideo = await _videoService.SaveAsync(request.File, ContainerName.SolutionVideos, cancellationToken);

                //create solution
                var userId = _accessTokenReader.GetRequiredAccountId();
                var video = new SolutionVideo(appVideo.BlobName, appVideo.Duration, appVideo.Length);
                var content = new SolutionContent(request.Content ?? "");
                var solution = new Solution(request.QuestionId, userId, content, video);
                await _solutionCreator.CreateAsync(solution, cancellationToken);
                await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return (await _solutionQueryRepository.GetByIdAsync(userId, solution.Id, cancellationToken))!;
            }
            catch (Exception)
            {
                if(appVideo != null)
                    await _blobService.DeleteAsync(ContainerName.SolutionVideos,appVideo.BlobName,cancellationToken);
                throw;
            }
        }
    }
}
