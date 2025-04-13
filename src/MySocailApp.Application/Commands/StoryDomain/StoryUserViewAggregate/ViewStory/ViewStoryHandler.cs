using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Absracts;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.DomainServices;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Entities;

namespace MySocailApp.Application.Commands.StoryDomain.StoryUserViewAggregate.ViewStory
{
    public class ViewStoryHandler(IUnitOfWork unitOfWork, StoryUserViewCreatorDomainService storyUserViewCreatorDomainService, IStoryUserViewRepository storyUserViewRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<ViewStoryDto, ViewStoryResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly StoryUserViewCreatorDomainService _storyUserViewCreatorDomainService = storyUserViewCreatorDomainService;
        private readonly IStoryUserViewRepository _storyUserViewRepository = storyUserViewRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<ViewStoryResponseDto> Handle(ViewStoryDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();
            var storyUserView = new StoryUserView(request.StoryId, login.UserId);
            await _storyUserViewCreatorDomainService.CreateAsync(storyUserView, cancellationToken);
            await _storyUserViewRepository.CreateAsync(storyUserView, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            return new(storyUserView, login);
        }
    }
}
