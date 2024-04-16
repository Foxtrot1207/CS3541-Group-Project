/// This class is used to calculate the BMI.
class CalcBMIModel {
  /// This function calculates the BMI using the weight and height.
  /// It throws an error if the weight or height is less than or equal to zero.
  double bmiCalc(double weight, double height) {
    /// Handles error cases like 0 or negative numbers.
    if(weight <= 0 || height <= 0){
      throw ArgumentError("Weight and height must be greater than zero.");
    }
    return ((weight * 703) / (height * height));
  }
}