# CogniCURE <img src="app/assets/images/metoday.png" alt="Your Logo" width="35">


> **Bachelor's Thesis' Project**
> 
> **Work in progress**

### CogniCure: Unlocking Minds, Embracing Growth – Your Path to Mental Wellness and Personal Transformation
CogniCure aims to be an innovative online platform designed to facilitate improved mental health and personal development in an accessible, interactive and personalized way. The main objective is exploring the crucial role of interactive elements in online platforms dedicated to mental health and self development, highlighting their significance in improving user engagement, facilitating learning and promoting positive change of behavior.

## Installation 
### Prerequisites

![Static Badge](https://img.shields.io/badge/Ruby-v3.1.3-%23CC342D?logo=ruby)
![Static Badge](https://img.shields.io/badge/Ruby%20on%20Rails-v7.0.4-%23D30001?logo=rubyonrails)
![Static Badge](https://img.shields.io/badge/Node.js-v16.18.0-%23339933?logo=nodedotjs&logoColor=white)
![Static Badge](https://img.shields.io/badge/Yarn-v1.22.19-%232C8EBB?logo=yarn&logoColor=white)
![Static Badge](https://img.shields.io/badge/PostgreSQL-v1.1-%234169E1?logo=postgresql&logoColor=white)

> [!NOTE]
> In order to install Rails on Windows, [Ruby Installer](https://rubyinstaller.org/) is required. Then, run `gem install rails`.

A local database is required in order to run the application. The schema can be seen in the following image:

![Database](https://github.com/Andreea2422/CogniCure/assets/100094242/d4c89aed-ce63-4c77-9b64-44c8afd97449)


To access the new database, a new `master.key` needs to be generated using the `rails credentials:edit` command. Once obtained, it can be used to create new encrypted credentials for the local database.


## Usage
The platform allows account creation and caters to three types of users, with the following features:
1. **Unregistered users** ( :information_source: These features can also be accessed by the other types of users.)
    <details> <summary>Article Reading</summary> 
        Users are offered a wide range of resources in the "Discover A-Z" page, resources that can be accessed without the need for an account. They can use the search bar to search for specific keywords. Keywords are suggested based on what is entered in the searchbar. A list of all keywords is displayed further down the page, each redirecting to a page with articles containing that keyword.
      
      ![CogniCure - Google Chrome 2024-03-24 21-09-45 (online-video-cutter com) (1)](https://github.com/Andreea2422/CogniCure/assets/100094242/dd374c84-762b-4128-a365-1e7d705d378b)

     The link "Self-growth" links to a page with all articles containing keywords related to personal development. "Techniques to use" works in the same way. The "Mental Health" page is intended for users who suffer in particular from the respective disorders, but also for those who want to get more information about the topics addressed. Also in the Discover section, the site also offers a more interactive part where users can take quizzes from the various fields covered on the site, some examples being "What's my personality type?", "How much do you know about anxiety?" and so on. These quizzes can be retaken any number of times.
    </details>

    <details> <summary>View Therapists</summary> 
        A list of therapists registered on the platform can also be consulted. This list can be filtered by certain categories, and selecting a therapist will redirect the user to their profile.

   ![image](https://github.com/Andreea2422/CogniCure/assets/100094242/2d70e287-d78f-47a0-96ec-82dba3909294)

   </details>
   
1. **Registered users with no attribute**
   <details> <summary> My Journal </summary> 
     
      By accessing the "My Journal" page, the user will be redirected to a mood-tracker. The user chooses a mood from the given categories that will be associated with the current day, after which the chart and diary will be updated. They can also input any feelings they had during the day that affected their mood in the journal.
     
     ![CogniCure - Google Chrome 2024-03-23 20-24-58 (online-video-cutter com) (3)](https://github.com/Andreea2422/CogniCure/assets/100094242/0919e076-9aaf-4187-9fdd-7fee7f26d2c0)

      The user can view their moods from the current week or have the option to display all moods from the current month. They can also navigate through previous weeks and months. The chart was made using the **Chartkick** library.

      ![MoodTrackerAF](https://github.com/Andreea2422/CogniCure/assets/100094242/0e9ed07d-f668-4886-828d-6c2f80ce82f6)


   </details>
   
   <details> <summary> Appointments </summary> 
      By accessing the "Appointments" page, the user can view the appointments made with certain therapists. Here they can see upcoming appointments, as well as past ones. The user can also opt to make a new appointment. Once on the new page, they will be greeted with a list of therapists from which they will have to select the one they want to complete the appointment form for. The user will be asked for a patient name and to choose a time when the therapist is free to contact them. The calendar is updated according to the selected therapist. Each therapist can only have one appointment per day. Busy days will be blocked and cannot be selected from the calendar.
   

   </details>
   <details> <summary> Pathways of Insight </summary> 
       Another important interactive element is in the serious game "Pathways of Insight" that implements a choice-based gameplay. The game offers three categories from where the situations with their respective choices can start. This category is decided based on the user's chosen mood on that day, or will be randomly assigned by a number from one to three if there is no registered mood.
   

   </details>
   
2. **Registered users with attribute (Therapists)**
   <details> <summary> Therapists' Details </summary> 
     When a user registers as a therapist, they have to create a public profile for them in order to be discovered by other users on the site. They can enter a short biography, the fields in which they work, their work experience and some contact information. This information can also be updated later if necessary.


   </details>
   <details> <summary> View Appointments </summary> 
     A user can view the appointments they currently have with different patients, both past and upcoming.

   </details>
   <details> <summary> Post Articles </summary> 
     Therapists can create articles that will be saved and viewed on the platform. They can enter a title, a small description of what the article is about, attach a cover image, add the content of the article taking into account the rules displayed to format it, the reading time of the article and, if necessary, a quote deemed appropriate for the article. In addition, for a valid article, certain keywords must be selected from a given list to categorize the article in a specific field.

   </details>


## Testing
Unit testing and integration testing were used to test the application. These tests were created using the **Minitest** library. Most of the integration tests used Top-down incremental integration. To run the tests, run the command `rails test`.



