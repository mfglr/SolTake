using AutoMapper;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class CommentMappers : Profile
    {
        public CommentMappers(IAccessTokenReader tokenReader) {
            CreateMap<Comment, CommentResponseDto>()
                .ForMember(dest => dest.IsLiked, x => x.MapFrom(src => src.Likes.Any(x => x.AppUserId == tokenReader.GetRequiredAccountId())))
                .ForMember(dest => dest.Content, x => x.MapFrom(src => src.Content.Value))
                .ForMember(dest => dest.NumberOfLikes, x => x.MapFrom(src => src.Likes.Count))
                .ForMember(dest => dest.NumberOfReplies, x => x.MapFrom(src => src.Children.Count))
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.AppUser.Account.UserName));
        }
        public CommentMappers() { }
    }
}
