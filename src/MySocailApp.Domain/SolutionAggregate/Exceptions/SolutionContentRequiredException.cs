using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionContentRequiredException : AppException
    {
        private readonly static string _messageEn = "You must upload images or a video or type something about questions!";
        private readonly static string _messageTr = "Çözüme hakkında bir şeyler yazmalı ya da resim veya video yüklemelisin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionContentRequiredException() : base((int)HttpStatusCode.BadRequest){}
    }
}
