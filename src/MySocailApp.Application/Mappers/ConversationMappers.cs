using AutoMapper;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.ConversationAggregate;
using MySocailApp.Domain.ConversationAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class ConversationMappers : Profile
    {
        public ConversationMappers(IAccessTokenReader tokenReader)
        {
            CreateMap<Conversation, ConversationResponseDto>()
                .ForMember(
                    dest => dest.UserId,
                    x => x.MapFrom(
                        src => src.Users.First(x => x.AppUserId != tokenReader.GetRequiredAccountId()).AppUserId
                    )
                )
                .ForMember(
                    dest => dest.UserName,
                    x => x.MapFrom(
                        src => src.Users.First(x => x.AppUserId != tokenReader.GetRequiredAccountId()).AppUser.Account.UserName
                    )
                )
                .ForMember(
                    dest => dest.Name,
                    x => x.MapFrom(
                        src => src.Users.First(x => x.AppUserId != tokenReader.GetRequiredAccountId()).AppUser.Name
                    )
                );
        }
        public ConversationMappers() { }
    }
}
