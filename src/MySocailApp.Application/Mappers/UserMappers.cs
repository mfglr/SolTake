using AutoMapper;
using MySocailApp.Application.Commands.UserAggregate.AddUserSearcher;
using MySocailApp.Application.Commands.UserAggregate.Follow;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers()
        {
            CreateMap<Follow, FollowCommandResponseDto>();
            CreateMap<UserSearch, AddUserSearcherCommandResponseDto>();
        }
    }
}
