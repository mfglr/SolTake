namespace MySocailApp.Domain.AccountDomain.AccountAggregate.Configurations
{
    public interface IFaceBookSettings
    {
        string AppId { get; }
        string AppSecret { get; }
    }
}
