using AutoMapper;
using MySocailApp.Application.Queries.SubjectAggregate;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class SubjectMappers : Profile
    {
        public SubjectMappers()
        {
            CreateMap<Subject, SubjectResponseDto>();
        }
    }
}
