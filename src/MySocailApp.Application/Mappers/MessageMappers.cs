using AutoMapper;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class MessageMappers : Profile
    {
        public MessageMappers()
        {
            CreateMap<Message, MessageResponseDto>()
                .ForMember(dest => dest.State, x => x.MapFrom(src => src.State));
            CreateMap<MessageMultimedia, MessageMultimediaResponseDto>();
        }
    }
}
