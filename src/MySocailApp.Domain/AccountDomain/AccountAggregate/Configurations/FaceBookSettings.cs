namespace MySocailApp.Domain.AccountDomain.AccountAggregate.Configurations
{
    public record FaceBookSettings(string AppId, string AppSecret) : IFaceBookSettings;
}
