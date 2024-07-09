using AutoMapper;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.PostAggregate;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Application.Mappers
{
    public class QuestionMappers : Profile
    {
        public QuestionMappers()
        {
            CreateMap<QuestionImage, QuestionImageResponseDto>();
            CreateMap<Question, QuestionResponseDto>()
                .ForMember(dest => dest.Topics, x => x.MapFrom(src => src.QuestionTopics.Select(topic => new TopicResponseDto(topic.Topic.Id, topic.Topic.Name)).ToList()))
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.AppUser.Account.UserName));
        }
    }
}
