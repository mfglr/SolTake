using MediatR;
using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Queries.MessageAggregate.GetNewMessageSenders
{
    public record GetNewMessageSendersDto() : IRequest<List<AppUserResponseDto>>;
}
