using AutoMapper;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class MessageMappers : Profile
    {
        public MessageMappers()
        {
            CreateMap<Message, MessageResponseDto>()
                .ForMember(dest => dest.State, x => x.MapFrom(src => src.State()));
            CreateMap<MessageImage, MessageImageResponseDto>();
        }
    }
}
