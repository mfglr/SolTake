using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Application.ApplicationServices.BlobService.VideoServices;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateVideoSolution
{
    public class CreateVideoSolutionHandler(ISolutionQueryRepository solutionQueryRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IVideoService videoService, SolutionCreatorDomainService solutionCreator) : IRequestHandler<CreateVideoSolutionDto, SolutionResponseDto>
    {
        private readonly IVideoService _videoService = videoService;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;
        private readonly SolutionCreatorDomainService _solutionCreator = solutionCreator;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<SolutionResponseDto> Handle(CreateVideoSolutionDto request, CancellationToken cancellationToken)
        {
            var appVideo = await _videoService.SaveAsync(request.File, ContainerName.SolutionVideos,ContainerName.SolutionImages, cancellationToken);
            var video = new SolutionVideo(appVideo.BlobName, appVideo.Duration, appVideo.Length, appVideo.Frame.BlobName,appVideo.Frame.Dimention.Height, appVideo.Frame.Dimention.Width);
            var content = new SolutionContent(request.Content ?? "");
            var solution = new Solution(content, video);
            
            var accountId = _accessTokenReader.GetRequiredAccountId();
            await _solutionCreator.CreateAsync(solution, accountId, request.QuestionId, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _solutionQueryRepository.GetByIdAsync(accountId, solution.Id, cancellationToken))!;
        }
    }
}
