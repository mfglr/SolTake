using AutoMapper;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionAggregate;
using Newtonsoft.Json.Linq;

namespace MySocailApp.Application.Mappers
{
    public class QuestionMappers : Profile
    {
        public QuestionMappers(IAccessTokenReader tokenReader)
        {
            CreateMap<QuestionImage, QuestionImageResponseDto>()
                .ForMember(dest => dest.Height,x => x.MapFrom(src => src.Dimention.Height))
                .ForMember(dest => dest.Width,x => x.MapFrom(src => src.Dimention.Width));

            CreateMap<Question, QuestionResponseDto>()
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.AppUser.Account.UserName))
                .ForMember(dest => dest.ExamName, x => x.MapFrom(src => src.Exam.ShortName))
                .ForMember(dest => dest.SubjectName, x => x.MapFrom(src => src.Subject.Name))
                .ForMember(dest => dest.IsLiked, x => x.MapFrom(src => src.Likes.Any(x => x.AppUserId == tokenReader.GetAccountId())))
                .ForMember(dest => dest.NumberOfLikes, x => x.MapFrom(src => src.Likes.Count))
                .ForMember(dest => dest.Topics, x => x.MapFrom(src => src.Topics.Select(topic => new QuestionTopicResponseDto(topic.Topic.Id, topic.Topic.Name)).ToList()));

        }
        public QuestionMappers() { }
    }
}
