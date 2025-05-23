using AutoMapper;
using SolTake.Application.Commands.UserDomain.UserUserSearchAggregate.Create;
using SolTake.Domain.UserUserSearchAggregate.Entities;

namespace SolTake.Application.Mappers
{
    public class UserMappers : Profile
    {
        public UserMappers()
        {
            CreateMap<UserUserSearch, CreateUserUserSearchResponseDto>();
        }
    }
}
