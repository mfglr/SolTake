using AutoMapper;
using MySocailApp.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave;
using MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeDownvote;
using MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeUpvote;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class SolutionMappers : Profile
    {
        public SolutionMappers()
        {
            CreateMap<SolutionUserVote, MakeUpvoteResponseDto>();
            CreateMap<SolutionUserVote, MakeDownvoteResponseDto>();
            CreateMap<SolutionUserSave, CreateSolutionUserSaveResponseDto>();
        }
    }
}
