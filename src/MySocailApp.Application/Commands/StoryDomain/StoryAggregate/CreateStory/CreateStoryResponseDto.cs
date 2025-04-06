using MySocailApp.Core;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Entities;

namespace MySocailApp.Application.Commands.StoryDomain.StoryAggregate.CreateStory
{
    public class CreateStoryResponseDto(Story story, Login login)
    {
        public int Id { get; private set; } = story.Id;
        public DateTime CreatedAt { get; private set; } = story.CreatedAt;
        public bool IsViewed { get; private set; } = false;
        public int UserId { get; private set; } = story.UserId;
        public string UserName { get; private set; } = login.UserName;
        public Multimedia? Image { get; private set; } = login.Image;
        public Multimedia Media { get; private set; } = story.Media;
    }
}