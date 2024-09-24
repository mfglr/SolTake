using AutoMapper;
using MySocailApp.Application.Commands.SolutionAggregate.MakeDownvote;
using MySocailApp.Application.Commands.SolutionAggregate.MakeUpvote;
using MySocailApp.Application.Commands.SolutionAggregate.SaveSolution;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class SolutionMappers : Profile
    {
        public SolutionMappers()
        {
            CreateMap<SolutionUserVote, MakeUpvoteCommandResponseDto>();
            CreateMap<SolutionUserVote, MakeDownvoteCommandResponseDto>();
            CreateMap<SolutionUserSave, SaveSolutionCommandResponseDto>();
        }
    }
}
