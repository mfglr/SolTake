using AutoMapper;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class QuestionMappers : Profile
    {
        public QuestionMappers(IAccessTokenReader tokenReader)
        {
            CreateMap<QuestionImage, QuestionImageResponseDto>();

            CreateMap<Question, QuestionResponseDto>()
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.AppUser.Account.UserName))
                .ForMember(dest => dest.IsLiked, x => x.MapFrom(src => src.Likes.Any(x => x.AppUserId == tokenReader.GetAccountId())))
                .ForMember(dest => dest.NumberOfLikes, x => x.MapFrom(src => src.Likes.Count))
                .ForMember(dest => dest.IsOwner, x => x.MapFrom(src => src.AppUserId == tokenReader.GetRequiredAccountId()))
                .ForMember(dest => dest.Topics, x => x.MapFrom(src => src.Topics.Select(topic => new QuestionTopicResponseDto(topic.Topic.Id,topic.Topic.SubjectId,topic.Topic.Name)).ToList()));
        }
        public QuestionMappers() { }
    }
}
