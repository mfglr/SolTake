﻿using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserDomain.UserAggregate.Exceptions
{
    public class InvalidLanguageException : AppException
    {
        private readonly static string _messageEn = "The language is invalid!";
        private readonly static string _messageTr = "Bu dil geçersiz!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidLanguageException() : base((int)HttpStatusCode.NotFound) { }
    }
}
