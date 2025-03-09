using AutoMapper;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MakeDownvote;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MakeUpvote;
using MySocailApp.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class SolutionMappers : Profile
    {
        public SolutionMappers()
        {
            CreateMap<SolutionUserVote, MakeUpvoteCommandResponseDto>();
            CreateMap<SolutionUserVote, MakeDownvoteCommandResponseDto>();
            CreateMap<SolutionUserSave, CreateSolutionUserSaveResponseDto>();
        }
    }
}
