using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocialApp.Domain.Tests.UnitTests.UserAggregate
{
    public class UserUnitTests
    {
        private readonly AppUser _user;
        private readonly string _userName = "test";
        private readonly string _id = Guid.NewGuid().ToString();
        private readonly Random _random = new();
        public UserUnitTests()
        {
            _user = new AppUser(_id, _userName);
        }

        [Fact]
        public void User_WhenUserInitialized_ShouldBeTrue()
        {
            Assert.Equal(_id, _user.Id);
            Assert.Equal(default, _user.CreatedAt);
            Assert.Null(_user.UpdatedAt);
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

        [Fact]
        public void Create_WhenUserCreated_ShouldBeTrue()
        {
            _user.Create();

            Assert.Equal(_id, _user.Id);
            Assert.NotEqual(default, _user.CreatedAt);
            Assert.Null(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Null(_user.Name);
            Assert.Equal(Gender.Default, _user.Gender);
            Assert.Null(_user.BirthDate);
            Assert.Equal(ProfileVisibility.Public, _user.ProfileVisibility);
            Assert.Empty(_user.Followers);
            Assert.Empty(_user.Followeds);
            Assert.Empty(_user.Requesters);
            Assert.Empty(_user.Requesteds);
            Assert.Empty(_user.Blockers);
            Assert.Empty(_user.Blockeds);
        }

        [Fact]
        public void UpdateUserName_WhenUserNameUpdated_ShouldBeTrue()
        {
            var userName = "test1";

            _user.UpdateUserName(userName);

            Assert.Equal(_id, _user.Id);
            Assert.Equal(default, _user.CreatedAt);
            Assert.NotNull(_user.UpdatedAt);
            Assert.Equal(userName, _user.UserName);
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

        [Fact]
        public void UpdateName_WhenNameUpdated_ShouldBeTrue()
        {
            var name = "test";

            _user.UpdateName(name);

            Assert.Equal(_id, _user.Id);
            Assert.Equal(default, _user.CreatedAt);
            Assert.NotNull(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Equal(name,_user.Name);
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

        [Fact]
        public void UpdateName_WhenGenderUpdated_ShouldBeTrue()
        {
            var gender = (Gender)_random.Next(3);

            _user.UpdateGender(gender);

            Assert.Equal(_id, _user.Id);
            Assert.Equal(default, _user.CreatedAt);
            Assert.NotNull(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Null(_user.Name);
            Assert.Equal(gender, _user.Gender);
            Assert.Null(_user.BirthDate);
            Assert.Equal(ProfileVisibility.Private, _user.ProfileVisibility);
            Assert.Empty(_user.Followers);
            Assert.Empty(_user.Followeds);
            Assert.Empty(_user.Requesters);
            Assert.Empty(_user.Requesteds);
            Assert.Empty(_user.Blockers);
            Assert.Empty(_user.Blockeds);
        }

        [Fact]
        public void UpdateBirthDate_WhenBirthDataIsNotEalierThanCurrentTime_ReturnExcepion()
        {
            var birthDate = DateTime.UtcNow.AddDays(5);
            var message = "The date of birth must be earlier than the current date!";

            var exception = Assert.Throws<InvalidBirthDateException>(() =>_user.UpdateBirthDate(birthDate));
            Assert.Equal(message, exception.Message);
            Assert.Equal(_id, _user.Id);
            Assert.Equal(default, _user.CreatedAt);
            Assert.Null(_user.UpdatedAt);
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

        [Fact]
        public void UpdateBirthDate_WhenBirthDateUpdated_ShouldBeTrue()
        {
            var birthDate = DateTime.UtcNow.AddDays(-5);

            _user.UpdateBirthDate(birthDate);

            Assert.Equal(_id, _user.Id);
            Assert.Equal(default, _user.CreatedAt);
            Assert.NotNull(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Null(_user.Name);
            Assert.Equal(Gender.Default, _user.Gender);
            Assert.Equal(birthDate,_user.BirthDate);
            Assert.Equal(ProfileVisibility.Private, _user.ProfileVisibility);
            Assert.Empty(_user.Followers);
            Assert.Empty(_user.Followeds);
            Assert.Empty(_user.Requesters);
            Assert.Empty(_user.Requesteds);
            Assert.Empty(_user.Blockers);
            Assert.Empty(_user.Blockeds);
        }
        
        [Fact]
        public void WhenProfileIsMadaPublic_IfUserHasFollowRequests_TheFollowRequestsShouldBeAccepted()
        {
            var requesterId = Guid.NewGuid().ToString();

            _user.Create();
            var createdDate = _user.CreatedAt;
            _user.MakeProfilePrivate();
            _user.MakeFollowRequest(requesterId);
            _user.MakeProfilePublic();

            Assert.Equal(_id, _user.Id);
            Assert.Equal(createdDate, _user.CreatedAt);
            Assert.NotNull(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Null(_user.Name);
            Assert.Equal(Gender.Default, _user.Gender);
            Assert.Null(_user.BirthDate);
            Assert.Equal(ProfileVisibility.Public, _user.ProfileVisibility);
            
            Assert.Single(_user.Followers);
            var follower = _user.Followers[0];
            Assert.Equal(requesterId,follower.FollowerId);
            Assert.Equal(_user.Id, follower.FollowedId);
            Assert.NotEqual(default, _user.CreatedAt);

            Assert.Empty(_user.Followeds);
            Assert.Empty(_user.Requesters);
            Assert.Empty(_user.Requesteds);
            Assert.Empty(_user.Blockers);
            Assert.Empty(_user.Blockeds);
        }

        [Fact]
        public void MakeFollowRequest_WhenUsersTryToFollowThemselves_ReturnException()
        {
            var message = "You can't follow yourself!";

            var exception = Assert.Throws<UnableToFollowYourselfException>(() => _user.MakeFollowRequest(_id));
            Assert.Equal(message, exception.Message);
            Assert.Equal(_id, _user.Id);
            Assert.Equal(default, _user.CreatedAt);
            Assert.Null(_user.UpdatedAt);
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
        [Fact]
        public void MakeFollowRequest_WhenUsersTryToFollowTheirFollowers_ReturnException()
        {
            var message = "You have followed the user before!";
            var followerId = Guid.NewGuid().ToString();

            _user.Create();
            var createdDate = _user.CreatedAt;
            _user.MakeFollowRequest(followerId);
            var exception = Assert.Throws<UserIsAlreadyFollowedException>(() => _user.MakeFollowRequest(followerId));
            
            Assert.Equal(message, exception.Message);
            Assert.Equal(_id, _user.Id);
            Assert.Equal(createdDate, _user.CreatedAt);
            Assert.Null(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Null(_user.Name);
            Assert.Equal(Gender.Default, _user.Gender);
            Assert.Null(_user.BirthDate);
            Assert.Equal(ProfileVisibility.Public, _user.ProfileVisibility);
            
            Assert.Single(_user.Followers);
            var follower = _user.Followers[0];
            Assert.Equal(followerId, follower.FollowerId);
            Assert.Equal(_user.Id, follower.FollowedId);
            Assert.NotEqual(default, _user.CreatedAt);

            Assert.Empty(_user.Followeds);
            Assert.Empty(_user.Requesters);
            Assert.Empty(_user.Requesteds);
            Assert.Empty(_user.Blockers);
            Assert.Empty(_user.Blockeds);
        }
        [Fact]
        public void MakeFollowRequest_WhenUsersTryToFollowAUserWhoMadeRequestToFollowBefore_ReturnException()
        {
            var message = "You have made a request to follow the user before!";
            var requesterId = Guid.NewGuid().ToString();

            _user.MakeFollowRequest(requesterId);
            var exception = Assert.Throws<FollowRequestAlreadyExistException>(() => _user.MakeFollowRequest(requesterId));

            Assert.Equal(message, exception.Message);
            Assert.Equal(_id, _user.Id);
            Assert.Equal(default, _user.CreatedAt);
            Assert.Null(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Null(_user.Name);
            Assert.Equal(Gender.Default, _user.Gender);
            Assert.Null(_user.BirthDate);
            Assert.Equal(ProfileVisibility.Private, _user.ProfileVisibility);
            Assert.Empty(_user.Followers);
            Assert.Empty(_user.Followeds);

            Assert.Single(_user.Requesters);
            var request = _user.Requesters[0];
            Assert.Equal(requesterId, request.RequesterId);
            Assert.Equal(_user.Id, request.RequestedId);
            Assert.NotEqual(default, request.CreatedAt);
            
            Assert.Empty(_user.Requesteds);
            Assert.Empty(_user.Blockers);
            Assert.Empty(_user.Blockeds);
        }
        [Fact]
        public void MakeFollowRequest_WhenUsersFollowAUserSuccessfully_ShouldBeTrue()
        {
            var followerId = Guid.NewGuid().ToString();
            
            _user.Create();
            var createdDate = _user.CreatedAt;
            _user.MakeFollowRequest(followerId);

            Assert.Equal(_id, _user.Id);
            Assert.Equal(createdDate, _user.CreatedAt);
            Assert.Null(_user.UpdatedAt);
            Assert.Equal(_userName, _user.UserName);
            Assert.Null(_user.Name);
            Assert.Equal(Gender.Default, _user.Gender);
            Assert.Null(_user.BirthDate);
            Assert.Equal(ProfileVisibility.Public, _user.ProfileVisibility);

            Assert.Single(_user.Followers);
            var follower = _user.Followers[0];
            Assert.Equal(followerId, follower.FollowerId);
            Assert.Equal(_user.Id, follower.FollowedId);
            Assert.NotEqual(default, _user.CreatedAt);

            Assert.Empty(_user.Followeds);
            Assert.Empty(_user.Requesters);
            Assert.Empty(_user.Requesteds);
            Assert.Empty(_user.Blockers);
            Assert.Empty(_user.Blockeds);
        }
        [Fact]
        public void MakeFollowRequest_WhenUsersFollowTheBlocker_ReturnException()
        {
            var blockerId = Guid.NewGuid().ToString();

            _user.Block(blockerId);
        }
    }
}
