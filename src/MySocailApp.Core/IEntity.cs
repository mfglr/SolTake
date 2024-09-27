namespace MySocailApp.Core
{
    public interface IEntity : IHasId, IDomainEventsContainer
    {
        DateTime CreatedAt { get; }
        DateTime? UpdatedAt { get; }
    }
}
