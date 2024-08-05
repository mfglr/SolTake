using AutoMapper;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class MessageMappers : Profile
    {
        public MessageMappers()
        {
            CreateMap<Message, MessageResponseDto>()
                .ForMember(dest => dest.State, x => x.MapFrom(src => src.State))
                .ForMember(dest => dest.SenderUserName, x => x.MapFrom(src => src.Sender.Account.UserName))
                .ForMember(dest => dest.ReceiverUserName, x => x.MapFrom(src => src.Receiver.Account.UserName));
            CreateMap<MessageImage, MessageImageResponseDto>();
        }
    }
}
