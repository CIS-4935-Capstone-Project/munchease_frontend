# MunchEase

Tinder but for food.

## Documentation
For majority of question regarding GETX follow this documentation or search on stackoverflow.
-- Of course im also available for questions :)

LINK: https://github.com/jonataslaw/getx

### **ALSO ISNTALL GetX Snippets v4.3.0 extension on VSCODE**
there are some stuff that I have added which detail the shortcuts you can use to write out some boilerplate code. 

## File Structure
### main.dart
Everything to do with GetMaterialApp is here.
This file also contains stuff regarding bindings, pages and theme related items. 

---
### models

This is the M in MVC or MVVC.  
models are basic classes for example we will have UserModel which will keep track of user specific details such as preferences, intolerances, and diets.

---
### utils
Code that will be useful throughout the app. 

**GetBinding** the bindings for the controllers will be here so if you create a new controller add it here.  
**GetPages** the routes and its definitions will be here so if you add a new screen create a new page here.

---
### controllers
C in MVC 
Controllers are the middle man between the UI and models. They manipulate the models data based on user interaction. 
<!-- TODO Add more details pertaining to this -->

---
### widgets
Widgets that will be reused throughout different screens. 
For example: the app bar which we might have is something that is shared across different screen this can be extracted into its own widget and then reused in all the other screens by just calling a variable.

---
### constants
Think stuff that is going to be constant throughout the app such as strings: email/password hints ; app colors etc.  

