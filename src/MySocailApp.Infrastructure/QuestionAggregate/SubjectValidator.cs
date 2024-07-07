using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class SubjectValidator : ISubjectValidator
    {
        public static readonly Subject[][] _subjects =
        [
            [//Tyt
                Subject.Turkce,
                Subject.Tarih,
                Subject.Cografya,
                Subject.Felsefe,
                Subject.Din,
                Subject.Matematik,
                Subject.Fizik,
                Subject.Kimya,
                Subject.Biyoloji
            ],
            [//Ayt
                Subject.Edebiyat,
                Subject.Tarih,
                Subject.Tarih1,
                Subject.Tarih2,
                Subject.Cografya,
                Subject.Cografya1,
                Subject.Cografya2,
                Subject.Felsefe,
                Subject.Psikoloji,
                Subject.Sosyoloji,
                Subject.Mantik,
                Subject.Din,
                Subject.Matematik,
                Subject.Geometri,
                Subject.Fizik,
                Subject.Kimya,
                Subject.Biyoloji
            ],
            [//Lgs
                Subject.Turkce,
                Subject.Inkilap,
                Subject.Din,
                Subject.Ingilizce,
                Subject.YabanciDil,
                Subject.Matematik,
                Subject.FenBilimleri
            ],
            [//Dgs
                Subject.Matematik,
                Subject.Geometri,
                Subject.Turkce
            ]
        ];

        public bool IsValid(Exam exam, Subject subject) => _subjects[(int)exam].Contains(subject);
    }
}
