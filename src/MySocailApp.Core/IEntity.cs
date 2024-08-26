namespace MySocailApp.Core
{
    public interface IEntity : IDomainEventsContainer
    {
        int Id { get; }
        DateTime CreatedAt { get; }
        DateTime? UpdatedAt { get; }
    }
}
