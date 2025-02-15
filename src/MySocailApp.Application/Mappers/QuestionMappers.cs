using AutoMapper;
using MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.SaveQuestion;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class QuestionMappers : Profile
    {
        public QuestionMappers()
        {
            CreateMap<QuestionMultimedia, QuestionMultimediaResponseDto>();
            CreateMap<QuestionUserSave, SaveQuestionCommandResponseDto>();
        }
    }
}
