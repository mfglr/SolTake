using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.ApplicationServices
{
    public class DomainEventsPublisher(IPublisher publisher, AppDbContext context) : IDomainEventsPublisher
    {
        private readonly IPublisher _publisher = publisher;
        private readonly AppDbContext _context = context;

        public void PublishDomainEvents(CancellationToken cancellationToken)
        {
            var containers = _context
                .ChangeTracker
                .Entries<IDomainEventsContainer>()
                .Where(x => x.Entity.Events.Any())
                .Select(x => x.Entity)
                .ToList();

            foreach (var continer in containers)
                foreach (var @event in continer.Events)
                    _publisher.Publish(@event, cancellationToken);
        }
    }
}
