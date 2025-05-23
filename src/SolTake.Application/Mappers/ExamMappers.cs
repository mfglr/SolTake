using AutoMapper;
using SolTake.Application.Queries.ExamAggregate;
using SolTake.Domain.ExamAggregate.Entitities;

namespace SolTake.Application.Mappers
{
    public class ExamMappers : Profile
    {
        public ExamMappers()
        {
            CreateMap<Exam, ExamResponseDto>();
        }
    }
}
