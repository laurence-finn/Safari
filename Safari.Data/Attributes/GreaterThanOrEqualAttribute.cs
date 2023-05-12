using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Safari.Data
{
    [AttributeUsage(AttributeTargets.Property)]
    internal class GreaterThanOrEqualAttribute : ValidationAttribute
    {
        private readonly string _otherProperty;

        public GreaterThanOrEqualAttribute(string otherProperty)
        {
            _otherProperty = otherProperty;
        }

        protected override ValidationResult IsValid(object? value, ValidationContext validationContext)
        {
            var otherPropertyInfo = validationContext.ObjectType.GetProperty(_otherProperty);
            if (otherPropertyInfo == null)
                throw new ArgumentException("Property not found", _otherProperty);

            var otherPropertyValue = otherPropertyInfo.GetValue(validationContext.ObjectInstance);

            if (value == null || otherPropertyValue == null || (decimal)value >= (decimal)otherPropertyValue)
                return ValidationResult.Success;

            return new ValidationResult(ErrorMessage);
        }
    }
}
