using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionContentOrImagesRequiredException : AppException
    {
        private readonly static string _messageEn = "You must upload images or type something about questions!";
        private readonly static string _messageTr = "Çözüme hakkında bir şeyler yazmalı ya da resim yüklemelisin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionContentOrImagesRequiredException() : base((int)HttpStatusCode.BadRequest){}
    }
}
