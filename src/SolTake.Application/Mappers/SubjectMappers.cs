using AutoMapper;
using SolTake.Application.Queries.SubjectAggregate;
using SolTake.Domain.SubjectAggregate.Entities;

namespace SolTake.Application.Mappers
{
    public class SubjectMappers : Profile
    {
        public SubjectMappers()
        {
            CreateMap<Subject, SubjectResponseDto>();
        }
    }
}
