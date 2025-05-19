using AutoMapper;
using MySocailApp.Application.Queries.CommentAggregate;
using SolTake.Domain.CommentUserLikeAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class CommentMappers : Profile
    {
        public CommentMappers() {
            CreateMap<CommentUserLike, CommentUserLikeResponseDto>();
        }
    }
}
