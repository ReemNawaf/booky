# Welcome to Booky App

Hi! I'm Booky app 👋!
I am glad you are here in the first day of your journey with me😄.
Lets start doing a great job😍!



# Flutter Setup

If you have not yet installed the Flutter framework, please follow the steps outlined in this link:**https://docs.flutter.dev/get-started/install**.

## VS code IDE

If you have not yet installed the VS code IDE, please install it from this link:
**https://code.visualstudio.com/download**.

## Install the code for day_1 branch from the repository.

This code is just UI and we are going to focus of Logic part. ![Download Booky code](https://askcloudarchitech.com/posts/tutorials/how-to-download-files-github/code-dropdown-zoom_huc3e0b416084c77df9873243bc51b9140_67546_0x1800_resize_q90_bgffffff_box_3.jpg)


## Firebase Setup:

I will guide you through the Firebase setup in a step-by-step manner.

 - [ ] Create a Firebase project:
 - Open Firebase console via this link: **https://firebase.google.com/?gad_source=1&gclid=CjwKCAiAsIGrBhAAEiwAEzMlCyldeaciL6CQZsFu2XYywUBPbSF-zwNGovlrzFjFISlqnEPXH1CQbxoC9cUQAvD_BwE&gclsrc=aw.ds**
 - If you're already registered, please login; otherwise, proceed to sign up.
 - Click on add a project.![add project](https://images.autiller.com/website/images/firebase-create-project.png)
 - Step 1: add project name![add name](https://media.geeksforgeeks.org/wp-content/uploads/20201225215333/Screenshot204.png)
 - Step2: switch off the Google analytics![Switch off Google ana](https://media.geeksforgeeks.org/wp-content/uploads/20201225215330/Screenshot205.png)
 - Step3: click on create a project button.
 
 - [ ] Create an Android App inside your project:
 - Step1: click on Android icon.![click on Android icon](https://firebase.google.com/static/docs/projects/images/firebase_console_overview.png?hl=pt-br)
 - Step2: add Android package name (you can find it in the code project : Android folder--> build.gradle file--> search for applicationId in that file (ctrl+f shortcut)).![add Android package name](https://images.ctfassets.net/piwi0eufbb2g/2OF4OLhxkbFj0WVVlsjave/b45d591bd731dd4bf465d58051ee87b3/Introduction_to_Firebase_And_How_to_Add_Firebase_to_App_-_ss16.png)
 - Step3: download the google-service.json file and put this file in app folder inside Android folder![download google-service.json file](https://media.geeksforgeeks.org/wp-content/uploads/3rd.png)
 - Step3: Add required lines to your code:![add code lines](https://alphatech.technology/images/posts/how-to-services-json/services-json-07.jpg)
***First line*** that you should put it in the build.gradle file in Android folder level is:

    dependencies {
    //add this line to your code
    classpath 'com.google.gms:google-services:4.4.0'
    }
***Second line*** that you should put it in the build.gradle file in app folder level in Android folder is:

    dependencies {
    //add this line to your code
implementation 'com.google.firebase:firebase-bom:32.6.0'
}
***Third line*** that you should put it in the build.gradle file in app folder level in Android folder is:

    apply plugin: 'com.google.gms.google-services'
    

 -Step4: enable email & password sign in method in the Firebase Authentication![sign in methods](https://miro.medium.com/v2/resize:fit:1400/1*ezS_zR2Fp_gkaTIFrNVzfw.png)
![enable email and password sign in method](https://s3-ap-southeast-1.amazonaws.com/djamblog/article-240120143016.png)
 - Add firebase_core and firebase_auth dart packages to your dependencies in pubspec.yaml file in the code project via this link :**https://pub.dev/**
 add this block of code in the main.dart file after the above step
 
**Note: there will be different api_key for android and ios** 
    FirebaseOptions(  
apiKey: "Your_Api_Key", // Replace with your API Key  
appId: "Your_App_Id", // Replace with your App ID  
messagingSenderId: "Your_Sender_Id", // Replace with your Sender ID  
projectId: "Your_Project_Id", // Replace with your Project ID  
// Other options can be added here as needed  
);

 - ***Final Step:*** make sure that the minSdkVersion in (Android>app>build.gradle) file is 23 and higher.
 
 ***If you got an error "unable to establish connection with Firebase channel" add this line of code to the AndroidManifest.xml file:***
    <application
//...
//add this line of code
android:enableOnBackInvokedCallback="true">

## Lets move to the most exciting part of coding 😎
**Wait ✋ I will tell you where you should put this code**😅
    const  SizedBox(height:  kTextTabBarHeight  +  100),

const  Center(

child:  SizedBox(

height:  50,

width:  150,

child:  LoadingIndicator(

indicatorType:  Indicator.ballBeat,

colors: [

AppColors.primaryColor,

AppColors.secondaryColor,

],

strokeWidth:  0.5,

),

),

),

## Hats Off! 🥳

Awesome job! 🌟 I wanted to give you a big shoutout for your hard work – I'm seriously impressed!  keep it up 👏👏👏

***For your homework,*** let's save user data in Firebase Firestore. Check out this video guide for assistance: 😃
https://www.youtube.com/watch?v=4vKiJZNPhss&t=386s&ab_channel=HeyFlutter%E2%80%A4com
