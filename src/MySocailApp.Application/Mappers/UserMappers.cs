using AutoMapper;
using MySocailApp.Application.Commands.UserAggregate.AddUserSearcher;
using MySocailApp.Application.Commands.UserAggregate.Block;
using MySocailApp.Application.Commands.UserAggregate.Follow;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers()
        {
            CreateMap<Follow, FollowCommandResponseDto>();
            CreateMap<UserSearch, AddUserSearcherCommandResponseDto>();
            CreateMap<Block, BlockCommandResponseDto>();
        }
    }
}
