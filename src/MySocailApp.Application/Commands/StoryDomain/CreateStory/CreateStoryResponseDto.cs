using MySocailApp.Core;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Entities;

namespace MySocailApp.Application.Commands.StoryDomain.CreateStory
{
    public class CreateStoryResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int UserId { get; private set; }
        public string UserName { get; private set; }
        public Multimedia? Image { get; private set; }
        public Multimedia Media { get; private set; }

        public CreateStoryResponseDto(int id, DateTime createdAt, int userId, string userName, Multimedia? image, Multimedia media)
        {
            Id = id;
            CreatedAt = createdAt;
            UserId = userId;
            UserName = userName;
            Image = image;
            Media = media;
        }

        public CreateStoryResponseDto(Story story, Login login)
        {
            Id = story.Id;
            CreatedAt = story.CreatedAt;
            UserId = story.UserId;
            UserName = login.UserName;
            Image = login.Image;
            Media = story.Media;
        }
    }
}