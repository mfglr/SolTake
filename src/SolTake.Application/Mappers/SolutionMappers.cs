using AutoMapper;
using SolTake.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave;
using SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeDownvote;
using SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeUpvote;
using SolTake.Domain.SolutionUserSaveAggregate.Entities;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;

namespace SolTake.Application.Mappers
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
