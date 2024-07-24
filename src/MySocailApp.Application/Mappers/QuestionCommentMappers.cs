using AutoMapper;
using MySocailApp.Application.Queries.QuestionCommentAggregate;
using MySocailApp.Domain.QuestionCommentAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class QuestionCommentMappers : Profile
    {
        public QuestionCommentMappers() {
            CreateMap<QuestionComment, QuestionCommentResponseDto>()
                .ForMember(dest => dest.Content, x => x.MapFrom(src => src.Content.Value))
                .ForMember(dest => dest.NumberOfLikes, x => x.MapFrom(src => src.Likes.Count))
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.AppUser.Account.UserName));
        }
    }
}
