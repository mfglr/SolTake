using AutoMapper;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class NotificationMappers : Profile
    {
        public NotificationMappers()
        {
            CreateMap<Notification, NotificationResponseDto>();
        }

    }
}
