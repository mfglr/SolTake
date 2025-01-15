namespace AccountDomain.Configurations
{
    public record FaceBookSettings(string AppId, string AppSecret) : IFaceBookSettings;
}
