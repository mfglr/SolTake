using AutoMapper;
using MySocailApp.Application.Commands.UserDomain.UserUserSearchAggregate.Create;
using MySocailApp.Domain.UserDomain.UserUserSearchAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers()
        {
            CreateMap<UserUserSearch, CreateUserUserSearchResponseDto>();
        }
    }
}
