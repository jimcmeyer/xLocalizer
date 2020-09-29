# xLocalizer
Translate "Localized Strings" in a Xojo project using AWS or Google Translate


Comments are welcome...  I am very open to suggestions....  It is also a work-in-progress...  something I do in spare time..

My testing has all been on the Eddie's Electronics sample app that comes with Xojo....  Its dynamic constants were well organized and easy to find.  As you will see below, I am depending on the undocumented structure of a Xojo "text" project....  My parsing code could certainly be missing some of the constants.  I am anxious to see how well it works for you.

It does require at least Xojo 2019R1 as I am using URLConnection...  no Plugins are required.

1.  You will need to get either a Google APIKey or AWS keys. 
For Google (generally recommended) go to cloud.google.com and create a Project, enable the Translate API and get an API key.

For AWS got to aws.amazon.com and create an IAM User...  then get the security credentials for that User.

Enter your key(s) in the Preferences window.

2.  Save your "target" Xojo project as a "Xojo Project"....  the one that saves everything as text files into a single folder.  (The translations use RegEx to find the constants in those files.)

3.  Run the xLocalize app...  

4.  If you have both AWS & Google keys then pick which service you want to use....  but you will only be able to select the service you have entered the keys for..  This is done first because the languages available vary based on which service you select.

(Google has an API call which returns a list of all supported languages...  so that list in the app is always up to date.  AWS does not have such a call so its list of available languages are hard coded and thus can be incomplete.  So if your desired language is not listed check their current documentation.)

5.  Select your target project’s Default language....

6.  Select Project folder....  ie your target Xojo project mentioned in step 2...  You should now see all the appropriate target project files in the list...  Click through the list and the available constants should display in the list below.....

6a. Only the constants that are not already translated for the "Target Language" are displayed...  (This way if you are updating an app with some new constants you only have to translate the new ones.)

6b.  You can now change the "Target Language" and see which constants need translation for that language.

6c.  If any of the constants are not set to "dynamic" they will appear in bold...  and the number that are found is displayed just above the top of the list.  You can then select that row and Edit->Copy...  then open your target project in Xojo, do a Edit->Find and Edit->Paste...  which will find the constant where that can easily be corrected....  Then save the target project.  (If your project is running under 2019R1 or newer then the naming has been changed to "localized strings"...  and they are listed separately from constants that are not "localized".)

7.  Once you are ready to translate...  just click that button....  and off it will go...  you can see the progress in the numbers displayed....  (ya, I should do a progress meter.)

8.  Once the translations are done, you can double click any one in the list to edit it....  (This is also a place where I should have an export button to create a file that could be sent to a translator for confirmation...  and an Import button to pull any changes they make back in.)

9.  Optional step (and very much incomplete/in-progress code)...  Click the "Check Size" button and the code will try to check the control types listed to see if they are big enough to fit the translated text....  any that do not will be in bold...  It currently checks Label, PushButton, BevelButton, CheckBox, RadioButton, GroupBox and any subclasses of those controls you may have created...  It does not check ListBox, TabPanel and some other controls...  Those could be added I just have not had the time...  They are also often more dynamic at runtime so it might not be real beneficial...  Also, the code currently requires that the control font size be set in "points"....

9a.  Just like with constants that are not marked dynamic, you can select the row that includes an undersized control, and Edit->Copy...  then go to the project and use Find to locate where it is...  and correct it...  Make sure you save the target project if you make any such changes.

10  Once you are happy with it all, hit the Accept button.... and those translations will be added back into your project.  

