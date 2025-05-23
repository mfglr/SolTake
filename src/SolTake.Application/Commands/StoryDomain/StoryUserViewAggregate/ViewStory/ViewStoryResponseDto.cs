using SolTake.Domain.StoryUserViewAggregate.Entities;
using SolTake.Core;

namespace SolTake.Application.Commands.StoryDomain.StoryUserViewAggregate.ViewStory
{
    public class ViewStoryResponseDto(StoryUserView storyUserView, Login login)
    {
        public int Id { get; private set; } = storyUserView.Id;
        public DateTime CreatedAt { get; private set; } = storyUserView.CreatedAt;
        public int UserId { get; private set; } = storyUserView.UserId;
        public string UserName { get; private set; } = login.UserName;
        public string? Name { get; private set; } = login.Name;
        public Multimedia? Image { get; private set; } = login.Image;
    }
}
