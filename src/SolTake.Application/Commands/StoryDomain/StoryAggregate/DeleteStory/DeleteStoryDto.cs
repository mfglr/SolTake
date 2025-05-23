using MediatR;

namespace SolTake.Application.Commands.StoryDomain.StoryAggregate.DeleteStory
{
    public record DeleteStoryDto(int StoryId) : IRequest;
}
