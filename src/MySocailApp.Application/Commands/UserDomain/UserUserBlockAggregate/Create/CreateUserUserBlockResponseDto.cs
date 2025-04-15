using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.UserUserBlockAggregate.Create
{
    public class CreateUserUserBlockResponseDto(UserUserBlock UserUserBlock, Login Login)
    {
        public int Id { get; private set; } = UserUserBlock.Id;
        public string UserName { get; private set; } = Login.UserName;
        public string? Name { get; private set; } = Login.Name;
        public Multimedia? Image { get; private set; } = Login.Image;
    }
}
