using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocialApp.Domain.Tests.UnitTests.UserAggregate
{
    public class MakeProfilePrivate
    {
        private readonly AppUser _user;
        private readonly string _id;
        private readonly string _userName;
        public MakeProfilePrivate()
        {
            _id = Guid.NewGuid().ToString();
            _userName = "test";
            _user = new AppUser(_id, _userName);
        }

        [Fact]
        public void WhenProfileIsAlreadyPrivate_ThrowProfileIsAlreadyPrivateException()
        {
            var message = "Your profile is already private!";
            var exception = Assert.Throws<ProfileIsAlreadyPrivateException>(() => _user.MakeProfilePrivate());
            Assert.Equal(message, exception.Message);
        }

        [Fact]
        public void WhenProfileIsPublic_ShouldBeTrue()
        {
            _user.Create();
            var createdDate = _user.CreatedAt;
            _user.MakeProfilePrivate();

            Assert.Equal(_id, _user.Id);
            Assert.Equal(createdDate, _user.CreatedAt);
            Assert.NotNull(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Null(_user.Name);
            Assert.Equal(Gender.Default, _user.Gender);
            Assert.Null(_user.BirthDate);
            Assert.Equal(ProfileVisibility.Private, _user.ProfileVisibility);
            Assert.Empty(_user.Followers);
            Assert.Empty(_user.Followeds);
            Assert.Empty(_user.Requesters);
            Assert.Empty(_user.Requesteds);
            Assert.Empty(_user.Blockers);
            Assert.Empty(_user.Blockeds);
        }
    }
}
