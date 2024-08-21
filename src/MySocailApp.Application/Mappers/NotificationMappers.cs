using AutoMapper;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class NotificationMappers : Profile
    {
        public NotificationMappers()
        {
            CreateMap<Notification, NotificationResponseDto>()
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.User.Account.UserName))
                .ForMember(dest => dest.CommentContent, x => x.MapFrom(src => src.Comment != null ? src.Comment.Content.Value : null))
                .ForMember(dest => dest.SolutionContent, x => x.MapFrom(src => src.Solution != null && src.Solution.Content != null ? src.Solution.Content.Value : null));
        }

    }
}
