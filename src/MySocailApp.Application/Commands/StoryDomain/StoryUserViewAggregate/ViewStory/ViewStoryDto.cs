using MediatR;

namespace MySocailApp.Application.Commands.StoryDomain.StoryUserViewAggregate.ViewStory
{
    public record ViewStoryDto(int StoryId) : IRequest<ViewStoryResponseDto>;
}
