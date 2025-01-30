namespace AccountDomain.AccountAggregate.Configurations
{
    public record FaceBookSettings(string AppId, string AppSecret) : IFaceBookSettings;
}
