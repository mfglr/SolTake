using AutoMapper;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class MessageMappers : Profile
    {
        public MessageMappers(IAccessTokenReader tokenReader)
        {
            CreateMap<Message, MessageResponseDto>()
                .ForMember(dest => dest.State, x => x.MapFrom(src => src.State()))
                .ForMember(dest => dest.IsOwner, x => x.MapFrom(src => src.OwnerId == tokenReader.GetAccountId()))
                .ForMember(
                    dest => dest.ReceiverId,
                    x => x.MapFrom(src => src.Conversation.Users.First(x => x.AppUserId != tokenReader.GetRequiredAccountId()).AppUserId)
                );

            CreateMap<MessageImage, MessageImageResponseDto>();
        }
        public MessageMappers() { }
    }
}
