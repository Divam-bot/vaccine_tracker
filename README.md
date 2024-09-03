# vaccine_tracker
covid-19 vaccine tracker cross platform application using flutter

**Project Scope:**
>As a digital System can reach the larger area of the country. The more people will become aware about how to book slots and do the process of vaccination. Discrimination on basis of economic or political background can be eliminated to a large extent when a digital system works on the concept of “First Come First Serve” which is freely available to all.
There is a centralized database which is not only accurate but also precise and easy to interpret. Such databases would help individuals to keep a track of their own vaccination.

**Project Goals:**
>To fasten the process of getting vaccinated we have proposed the idea of a Vaccine Tracker App.The goal is to achieve a system to keep a track of no. of slots available, types of vaccination available, no. of people vaccinated: first dose, second dose, track of time span between two doses if any individual, age bars etc. A digital system can ensure that each and every citizen is provided with equal opportunities and that there is no scope of any malpractices and corruption.

**Tools**
> - Flutter & Dart
> -  Firebase Firestore
> - Android Emulator

**Flutter Implementation**
> ![image](https://github.com/user-attachments/assets/9fb5fd5b-769c-4a1b-840a-78599c193118)<br>

This app contains following states: <br>
- *HOME*: It is the first page of the app and has a News-desk and Registration options.<br>
- *NEWS-DESK*: It shows trending news regarding vaccination and covid-19 precautions. <br>
- *Registration*: It has a Sign up and login option.<br>
- *OTP Sign-In*: Hassle free login using phone number of users.<br>
- *Location*: Users have to find their location using pin code or city/village name. In case there is no center at that location, our app will automatically suggest the nearest center.<br>
- *Normal Booking*: It is a simple booking system where a person has to book the slot and go to the center according to the schedule.<br>
- *Prior Booking*: Prior Booking is for those who have some genuine issues and want to book their slot in advance. They have to submit the paper or proof for verification.<br>
- *Analysis*: It includes verification of prior booking. If it fails then they have to book again.<br>
- *Status*: It shows the information of slot booking data and vaccination dose period.<br>
- *Tips*: User interactive Tips will be provided according to actions taken by the user on the app in the tips tab.<br>


**Data Flow Diagram:**
>
> ![image](https://github.com/user-attachments/assets/81f8e09e-b2c3-4b30-828c-6936f01a5e53)<br>

**Entity - Relation Diagram:**
>
> ![image](https://github.com/user-attachments/assets/ef4e3493-9d11-4f84-8c29-94b2a07f83d9)<br>

**App Walkthrough**
> - Enter Phone no. and Otp for login purpose<br>
> ![image](https://github.com/user-attachments/assets/af420521-69ea-42f3-8c6d-c6f9c561d243)<br>
> - Home Page<br>
> ![image](https://github.com/user-attachments/assets/931f3383-0114-49ba-92af-6a3aa71ff4d2)<br>
> - Select Location (Pin/State)<br>
> ![image](https://github.com/user-attachments/assets/1da7a7c0-15cf-4b28-9931-36fc935e784c)<br>
> - Booking and Confirmation <br>
> ![image](https://github.com/user-attachments/assets/ebdec733-6249-4d72-adda-02bcd29fbcfe)<br>
> - Success or Failure<br>
> ![image](https://github.com/user-attachments/assets/b3f4ed86-1842-419f-aeec-306e80b19dd6)<br>
> - News and Tips<br>
> ![image](https://github.com/user-attachments/assets/2d9e4079-5196-4781-b991-6dd23b51794d)<br>
> - Status Before & After Login<br>
> ![image](https://github.com/user-attachments/assets/2e1ce243-0e1d-4bd3-98e4-203adec33d2a)<br>
> - Due Date Popup<br>
> ![image](https://github.com/user-attachments/assets/a905d2cb-bf6d-4b91-a7dc-7e50a573d7e6)<br>

**System Testing**
>In order to effectively calculate and test our application we created a demo amount of dummy data and users. This helped us to test various aspects of our application.
Various aspects that we tested our application on are:
> 1. Security
> 2. Adaptable
> 3. Interactive
> 4. Transparency
> 5. Authenticity

**Scope for Future Enhancement:**
> - In our existing system we have proposed a Prior Booking Facility. Prior Booking is for those who have some genuine issues and want to book their slot in advance. They have to submit the paper or proof for verification. But to ease the process we will replace the manual labour with the appropriate System. There may be many people who can upload false documents to get the vaccine first and for manual Labour it is very difficult to correctly check each and every document. Computers cannot make such mistakes. So, it will be a time efficient system, less manual labour will be required etc.
> - There is a drawback of this app when it comes to people with vision impairment. Our System is not for those who have Vision Impairment problems. There will be such technology which will be beneficial to them also. They can book their slot on their own and know their vaccination information.
> - We will use ML to display the news according to the preference of the user. Suppose the user is fully vaccinated then there will be news regarding that only. If user has done with one dose only then there will be news regarding their date of second dose also.
> - The census about the number of Vaccinated People will be provided. By this people will be extra careful regarding that.

**Conclusion**
>The application is a cross-platform Flutter based system that will help people of our country as well as national institutions to easily get information about vaccination, about pandemics and also to keep track of vaccination (both on individual and collective basis).<br>
>
>Developing this application allowed us to learn various new concepts regarding mobile-app development for example, Flutter and Android Emulator. It also allowed us to learn about how government bodies are carrying out vaccination procedures and what all problems they are facing. Developing such an application connected us more to the society and the world around us.<br>
>
>The application is easy to use and user friendly, it also includes some additional features such as news and corona index as well as tips and precautions. Unlike other applications the app also includes features of notifications and “around the” pin-pointed location slots.<br>
  







