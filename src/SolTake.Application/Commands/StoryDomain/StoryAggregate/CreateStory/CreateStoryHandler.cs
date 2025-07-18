﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Domain.StoryAggregate.Abstracts;
using SolTake.Domain.StoryAggregate.Entities;
using SolTake.Core;

namespace SolTake.Application.Commands.StoryDomain.StoryAggregate.CreateStory
{
    public class CreateStoryHandler(IStoryRepository storyWriteRepository, IUnitOfWork unitOfWork, IMultimediaService multimediaService, IAccessTokenReader accessTokenReader, IBlobService blobService) : IRequestHandler<CreateStoryDto, List<CreateStoryResponseDto>>
    {
        private readonly IStoryRepository _storyWriteRepository = storyWriteRepository;
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
                medias = await _multimediaService.UploadAsync(ContainerName.StoryMedias, request.Medias.Reverse(), cancellationToken);
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
