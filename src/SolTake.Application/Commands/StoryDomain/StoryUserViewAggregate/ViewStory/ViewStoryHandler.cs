using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.StoryUserViewAggregate.Entities;
using SolTake.Domain.StoryUserViewAggregate.Absracts;
using SolTake.Domain.StoryUserViewAggregate.DomainServices;

namespace SolTake.Application.Commands.StoryDomain.StoryUserViewAggregate.ViewStory
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
