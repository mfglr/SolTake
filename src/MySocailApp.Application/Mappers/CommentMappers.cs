using AutoMapper;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Application.Mappers
{
    public class CommentMappers : Profile
    {
        public CommentMappers() {
            CreateMap<CommentUserLike, CommentUserLikeResponseDto>();
        }
    }
}
