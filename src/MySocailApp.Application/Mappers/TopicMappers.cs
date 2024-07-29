using AutoMapper;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Domain.TopicAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class TopicMappers : Profile
    {
        public TopicMappers()
        {
            CreateMap<Topic, TopicResponseDto>();
        }
    }
}
