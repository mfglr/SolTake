using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public class LikeQuestionCommandResponseDto(QuestionUserLike like, Login login)
    {
        public int Id { get; private set; } = like.Id;
        public DateTime CreatedAt { get; private set; } = like.CreatedAt;
        public int QuestionId { get; private set; } = like.QuestionId;
        public int UserId { get; private set; } = like.UserId;
        public string? Name { get; private set; } = login.Name;
        public string UserName { get; private set; } = login.UserName;
        public Multimedia? Image { get; private set; } = login.Image;
    }
}
