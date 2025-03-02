using AutoMapper;
using MySocailApp.Application.Commands.UserDomain.UserSearchAggregate.CreateUserSearch;
using MySocailApp.Domain.UserDomain.UserSearchAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers()
        {
            CreateMap<UserSearch, CreateUserSearchResponseDto>();
        }
    }
}
