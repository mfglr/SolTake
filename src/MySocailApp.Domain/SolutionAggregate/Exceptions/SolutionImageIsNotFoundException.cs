﻿using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionImageIsNotFoundException : AppException
    {
        private readonly static string _messageEn = "Solution image was not found!";
        private readonly static string _messageTr = "Çözümün resmi bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionImageIsNotFoundException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}
