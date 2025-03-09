using AutoMapper;
using MySocailApp.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.CreateQuestionUserSave;
using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class QuestionMappers : Profile
    {
        public QuestionMappers()
        {
            CreateMap<QuestionMultimedia, QuestionMultimediaResponseDto>();
            CreateMap<QuestionUserSave, CreateQuestionUserSaveResponseDto>();
        }
    }
}
