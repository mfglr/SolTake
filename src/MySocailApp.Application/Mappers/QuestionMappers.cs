using AutoMapper;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Mappers
{
    public class QuestionMappers : Profile
    {
        public QuestionMappers(IAccessTokenReader tokenReader)
        {
            CreateMap<QuestionUserLike, QuestionUserLikeResponseDto>();
            CreateMap<QuestionImage, QuestionImageResponseDto>();
            CreateMap<Question, QuestionResponseDto>();
                //.ForMember(dest => dest.State, x => x.MapFrom(src => src.Solutions.Any(x => x.State == SolutionState.Correct) ? QuestionState.Solved : QuestionState.Unsolved))
                //.ForMember(dest => dest.IsOwner, x => x.MapFrom(src => src.AppUserId == tokenReader.GetRequiredAccountId()))
                //.ForMember(dest => dest.UserName, x => x.MapFrom(src => src.AppUser.Account.UserName))
                //.ForMember(dest => dest.IsLiked, x => x.MapFrom(src => src.Likes.Any(x => x.AppUserId == tokenReader.GetAccountId())))
                //.ForMember(dest => dest.NumberOfLikes, x => x.MapFrom(src => src.Likes.Count))
                //.ForMember(dest => dest.NumberOfComments, x => x.MapFrom(src => src.Comments.Count))
                //.ForMember(dest => dest.NumberOfSolutions, x => x.MapFrom(src => src.Solutions.Count))
                //.ForMember(dest => dest.NumberOfCorrectSolutions, x => x.MapFrom(src => src.Solutions.Count(x => x.State == SolutionState.Correct)))
                //.ForMember(dest => dest.Topics, x => x.MapFrom(src => src.Topics.Select(topic => new QuestionTopicResponseDto(topic.Topic.Id,topic.Topic.SubjectId,topic.Topic.Name)).ToList()));

        }
        public QuestionMappers() { }
    }
}
