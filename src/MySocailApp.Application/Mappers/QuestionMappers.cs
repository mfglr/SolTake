using AutoMapper;
using MySocailApp.Application.Commands.QuestionAggregate.LikeQuestion;
using MySocailApp.Application.Commands.QuestionAggregate.SaveQuestion;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class QuestionMappers : Profile
    {
        public QuestionMappers()
        {
            CreateMap<QuestionUserLike, QuestionUserLikeResponseDto>();
            CreateMap<QuestionMultimedia, QuestionMultimediaResponseDto>();
            CreateMap<QuestionUserLike, LikeQuestionCommandResponseDto>();
            CreateMap<QuestionUserSave, SaveQuestionCommandResponseDto>();
        }
    }
}
