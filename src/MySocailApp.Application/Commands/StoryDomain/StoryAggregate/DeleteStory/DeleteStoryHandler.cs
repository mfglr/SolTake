using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Abstracts;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Exceptions;

namespace MySocailApp.Application.Commands.StoryDomain.StoryAggregate.DeleteStory
{
    public class DeleteStoryHandler(IStoryWriteRepository storyWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<DeleteStoryDto>
    {
        private readonly IStoryWriteRepository _storyWriteRepository = storyWriteRepository;
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
