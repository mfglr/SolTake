using AutoMapper;
using MySocailApp.Application.Queries.ExamAggregate;
using SolTake.Domain.ExamAggregate.Entitities;

namespace MySocailApp.Application.Mappers
{
    public class ExamMappers : Profile
    {
        public ExamMappers()
        {
            CreateMap<Exam, ExamResponseDto>();
        }
    }
}
