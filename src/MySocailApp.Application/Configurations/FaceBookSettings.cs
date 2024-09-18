namespace MySocailApp.Application.Configurations
{
    public record FaceBookSettings(string AppId,string AppSecret) : IFaceBookSettings;
}
