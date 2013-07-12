using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace Kata
{
    [TestFixture]
    public class RomanNumeralTest
    {
        [Test]
        [TestCase(0, "")]
        [TestCase(1, "I")]
        [TestCase(2, "II")]
        [TestCase(3, "III")]
        [TestCase(4, "IV")]
        [TestCase(5, "V")]
        [TestCase(6, "VI")]
        [TestCase(7, "VII")]
        [TestCase(8, "VIII")]
        [TestCase(9, "IX")]
        [TestCase(10, "X")]
        [TestCase(11, "XI")]
        [TestCase(12, "XII")]
        [TestCase(13, "XIII")]
        [TestCase(19, "XIX")]
        [TestCase(24, "XXIV")]
        [TestCase(35, "XXXV")]
        [TestCase(46, "XLVI")]
        [TestCase(57, "LVII")]
        [TestCase(68, "LXVIII")]
        [TestCase(79, "LXXIX")]
        [TestCase(80, "LXXX")]
        [TestCase(91, "XCI")]
        [TestCase(191, "CXCI")]
        [TestCase(212, "CCXII")]
        [TestCase(323, "CCCXXIII")]
        [TestCase(434, "CDXXXIV")]
        [TestCase(545, "DXLV")]
        [TestCase(656, "DCLVI")]
        [TestCase(767, "DCCLXVII")]
        [TestCase(878, "DCCCLXXVIII")]
        [TestCase(989, "CMLXXXIX")]
        [TestCase(1000, "M")]
        [TestCase(2013, "MMXIII")]
        [TestCase(3105, "MMMCV")]
        public void ConvertNumberToRomanNumeral(int number, string romanNumeralString)
        {
            Assert.AreEqual(RomanNumeral.Convert(number), romanNumeralString);
        }
    }
}
