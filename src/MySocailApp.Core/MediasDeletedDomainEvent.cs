namespace MySocailApp.Core
{
    public record MediasDeletedDomainEvent(IEnumerable<Multimedia> Medias) : IDomainEvent;
}
