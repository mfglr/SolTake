using MediatR;

namespace SolTake.Application.Commands.StoryDomain.StoryUserViewAggregate.ViewStory
{
    public record ViewStoryDto(int StoryId) : IRequest<ViewStoryResponseDto>;
}
