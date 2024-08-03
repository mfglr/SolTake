using AutoMapper;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class MessageMappers : Profile
    {
        public MessageMappers()
        {
            CreateMap<Message, MessageResponseDto>();
            CreateMap<MessageImage, MessageImageResponseDto>();
        }
    }
}
