using AutoMapper;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Application.Mappers
{
    public class QuestionMappers : Profile
    {
        public QuestionMappers()
        {
            CreateMap<QuestionImage, QuestionImageResponseDto>()
                .ForMember(dest => dest.Height,x => x.MapFrom(src => src.Dimention.Height))
                .ForMember(dest => dest.Width,x => x.MapFrom(src => src.Dimention.Width));

            CreateMap<Question, QuestionResponseDto>()
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.AppUser.Account.UserName))
                .ForMember(dest => dest.ExamName, x => x.MapFrom(src => src.Exam.ShortName))
                .ForMember(dest => dest.SubjectName, x => x.MapFrom(src => src.Subject.Name))
                .ForMember(dest => dest.Topics, x => x.MapFrom(src => src.Topics.Select(topic => new QuestionTopicResponseDto(topic.Topic.Id, topic.Topic.Name)).ToList()));
        }
    }
}
