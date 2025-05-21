using AutoMapper;
using MySocailApp.Application.Commands.UserDomain.UserUserSearchAggregate.Create;
using SolTake.Domain.UserUserSearchAggregate.Entities;

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
