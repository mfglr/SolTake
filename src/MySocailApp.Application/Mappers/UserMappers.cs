using AutoMapper;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.AddUserSearcher;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers()
        {
            CreateMap<UserSearch, AddUserSearcherCommandResponseDto>();
        }
    }
}
