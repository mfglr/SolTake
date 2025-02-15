using AccountDomain.AccountAggregate.Entities;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public class LikeQuestionCommandResponseDto(QuestionUserLike like, Account account, User User)
    {
        public int Id { get; private set; } = like.Id;
        public DateTime LikedAt { get; private set; } = like.LikedAt;
        public int QuestionId { get; private set; } = like.QuestionId;
        public int UserId { get; private set; } = like.UserId;
        public string? Name { get; private set; } = User.Name;
        public string UserName { get; private set; } = account.UserName.Value;
        public Multimedia? Image { get; private set; } = User.Image;
    }
}
