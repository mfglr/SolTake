using AutoMapper;
using SolTake.Application.Queries.CommentAggregate;
using SolTake.Domain.CommentUserLikeAggregate.Entities;

namespace SolTake.Application.Mappers
{
    public class CommentMappers : Profile
    {
        public CommentMappers() {
            CreateMap<CommentUserLike, CommentUserLikeResponseDto>();
        }
    }
}
