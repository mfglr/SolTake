using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Abstracts;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Entities;

namespace MySocailApp.Application.Commands.StoryDomain.CreateStory
{
    public class CreateStoryHandler(IStoryWriteRepository storyWriteRepository, IUnitOfWork unitOfWork, IMultimediaService multimediaService, IAccessTokenReader accessTokenReader, IBlobService blobService) : IRequestHandler<CreateStoryDto, List<CreateStoryResponseDto>>
    {
        private readonly IStoryWriteRepository _storyWriteRepository = storyWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMultimediaService _multimediaService = multimediaService;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IBlobService _blobService = blobService;

        public async Task<List<CreateStoryResponseDto>> Handle(CreateStoryDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();
            IEnumerable<Multimedia> medias = [];
            try
            {
                medias = await _multimediaService.UploadAsync(ContainerName.StoryMedias, request.Medias, cancellationToken);
                List<Story> stories = [];
                foreach (var media in medias)
                {
                    var story = new Story(login.UserId, media);
                    story.Create();
                    stories.Add(story);
                }
                await _storyWriteRepository.CreateRangeAsync(stories, cancellationToken);
                await _unitOfWork.CommitAsync(cancellationToken);

                return stories.Select(story => new CreateStoryResponseDto(story, login)).ToList();
            }
            catch (Exception)
            {
                foreach (var media in medias)
                {
                    if (media.MultimediaType == MultimediaType.Video)
                        await _blobService.DeleteAsync(ContainerName.StoryMedias, media.BlobNameOfFrame!, cancellationToken);
                    await _blobService.DeleteAsync(ContainerName.StoryMedias, media.BlobName, cancellationToken);
                }
                throw;
            }
        }
    }
}
