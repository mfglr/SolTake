using MediatR;
using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Queries.MessageAggregate.GetConversations
{
    public record GetConversationsDto(int? LastValue,int? Take) : IRequest<List<AppUserResponseDto>>;
}
