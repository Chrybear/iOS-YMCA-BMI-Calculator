# iOS-YMCA-BMI-Calculator
A simple iOS app to calculate BMI using the YMCA BMI equation. Made for CSC 308 at EKU

Note* This app has only been tested on emulators using an iphone 11 as the framework. It may not operate correctly on other iOS devices.

To use: 
Run App.

The app will present you with several text fields and switches.
The user inputs include:

Name: You may enter your name here, either full or first or last or nickname or a fake name.
Gender: Please select your biological sex for accurate BMI calculations. (gender is a bit of an inapropriate name for this metric, but it is how the assignment asked it to be labeled)
Units of Measurement: Select prefered measurements and units, can be any combination of Pounds/Kilograms and Inches/Centimeters
Weight: Enter your current weight in whatever unit you selected from the Pounds/Kilograms option above
Waist: Diameter of your waist, in either Inches or centimeters based on what unit of measurement you had chosen above

After all information has been entered, select the "Get BMI" button to have an output of your BMI based on the information you have entered in previous steps.

Note* You MUST have entered something in all textfields. The app will notify you if any have been left blank and will not allow calculation to begin until all has at least some value.

Note* On an actual device, you are only allowed to enter numeric values for "Weight" and "Waist." However, in an emulator, you are capable of using a keyboard to type in characters that are not numeric. This may lead to errors.

Some test data:
Name: Smitty WerbenJagerManJensen
Gender: Male (default option)
Units of Measurement: Pounds & Inches (default options)
Weight: 180
Waist: 32

Expected output: "Hello, Smitty WerbenJagerManJensen! Your body fat percentage is estimated to be approximately 10.90%"
