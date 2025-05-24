using AutoMapper;
using SolTake.Application.Queries.TopicAggregate;
using SolTake.Domain.TopicAggregate.Entities;

namespace SolTake.Application.Mappers
{
    public class TopicMappers : Profile
    {
        public TopicMappers()
        {
            CreateMap<Topic, TopicResponseDto>();
        }
    }
}
