﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.StoryAggregate.Abstracts;
using SolTake.Domain.StoryAggregate.Exceptions;

namespace SolTake.Application.Commands.StoryDomain.StoryAggregate.DeleteStory
{
    public class DeleteStoryHandler(IStoryRepository storyWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<DeleteStoryDto>
    {
        private readonly IStoryRepository _storyWriteRepository = storyWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(DeleteStoryDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var story =
                await _storyWriteRepository.GetByIdAsync(request.StoryId, cancellationToken) ??
                throw new StoryNotFoundException();

            if(story.UserId != login.UserId)
                throw new PermissionDeniedToDeleteStoryException();

            _storyWriteRepository.Delete(story);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
