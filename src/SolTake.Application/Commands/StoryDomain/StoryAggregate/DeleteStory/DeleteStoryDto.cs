using MediatR;

namespace MySocailApp.Application.Commands.StoryDomain.StoryAggregate.DeleteStory
{
    public record DeleteStoryDto(int StoryId) : IRequest;
}
