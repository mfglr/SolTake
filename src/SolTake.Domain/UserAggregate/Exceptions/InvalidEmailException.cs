﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserAggregate.Exceptions
{
    public class InvalidEmailException : AppException
    {
        private readonly static string _messageEn = "The email is invalid!";
        private readonly static string _messageTr = "Email geçerli değil!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidEmailException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
