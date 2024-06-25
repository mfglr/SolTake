using MediatR;
using MySocailApp.Application.Services;

namespace MySocailApp.Application.PipelineBehaviours
{
    public class DomainEventsPublicationPipelineBehaviour<TRequest, TResponse>(IDomainEventsPublisher publisher) : IPipelineBehavior<TRequest, TResponse>
        where TRequest : notnull
    {
        private readonly IDomainEventsPublisher _publisher = publisher;

        public async Task<TResponse> Handle(TRequest request, RequestHandlerDelegate<TResponse> next, CancellationToken cancellationToken)
        {
            var response = await next();
            await _publisher.PublishDomainEvents(cancellationToken);
            return response;
        }
    }
}
