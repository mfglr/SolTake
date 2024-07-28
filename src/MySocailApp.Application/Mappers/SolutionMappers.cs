using AutoMapper;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Mappers
{
    public class SolutionMappers : Profile
    {
        public SolutionMappers(IAccessTokenReader reader)
        {
            CreateMap<SolutionImage, SolutionImageResponseDto>();
            CreateMap<Solution, SolutionResponseDto>()
                .ForMember(dest => dest.BelongsToQuestionOfCurrentUser, x=> x.MapFrom(src => src.Question.AppUserId == reader.GetRequiredAccountId()))
                .ForMember(dest => dest.IsUpvoted, x => x.MapFrom(src => src.Votes.Any(x => x.AppUserId == reader.GetRequiredAccountId() && x.Type == SolutionVoteType.Upvote)))
                .ForMember(dest => dest.IsDownvoted, x => x.MapFrom(src => src.Votes.Any(x => x.AppUserId == reader.GetRequiredAccountId() && x.Type == SolutionVoteType.Downvote)))
                .ForMember(dest => dest.NumberOfUpvotes, x => x.MapFrom(src => src.Votes.Count(x => x.Type == SolutionVoteType.Upvote)))
                .ForMember(dest => dest.NumberOfDownvotes, x => x.MapFrom(src => src.Votes.Count(x => x.Type == SolutionVoteType.Downvote)))
                .ForMember(dest => dest.NumberOfComments, x => x.MapFrom(src => src.Comments.Count))
                .ForMember(dest => dest.IsOwner, x => x.MapFrom(src => src.AppUserId == reader.GetRequiredAccountId()))
                .ForMember(dest => dest.UserName, x => x.MapFrom(src => src.AppUser.Account.UserName));
        }
        public SolutionMappers() { }
    }
}
