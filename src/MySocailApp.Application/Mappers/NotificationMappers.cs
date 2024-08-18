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
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.User.Account.UserName));
        }

    }
}
