using AutoMapper;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class MessageMappers : Profile
    {
        public MessageMappers(IAccessTokenReader tokenReader)
        {
            CreateMap<Message, MessageResponseDto>()
                .ForMember(dest => dest.State, x => x.MapFrom(src => src.State()))
                .ForMember(dest => dest.ReceiptedAt,x => x.MapFrom(src => src.ReceiptedAt))
                .ForMember(dest => dest.ViewedAt, x => x.MapFrom(src => src.ViewedAt));
            CreateMap<MessageImage, MessageImageResponseDto>();
        }

        public MessageMappers() { }
    }
}
