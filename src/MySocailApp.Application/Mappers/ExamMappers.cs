using AutoMapper;
using MySocailApp.Application.Queries.ExamAggregate;
using MySocailApp.Domain.QuestionDomain.ExamAggregate.Entitities;

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
