using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserReceiveAggregate.Create
{
    public record CreateMessageUserReceiveDto(int MessageId) : IRequest<CreateMessageUserReceiveResponseDto>;
}
