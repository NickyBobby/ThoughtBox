# ThoughtBox

#### This is an app for saving links. Why use bookmarks when you got ThoughtBox!

##### [production link](http://desolate-beach-33159.herokuapp.com/)


##### Technical Specs

This project was written with a Rails back end and a JavaScript (GuavaScript) front end.

##### Learning Goals/Woes

I wrote this app in 8 hours as a mock eval for our class at the Turing School. The goal was to see how fast I could write a CRUD app with fully unique sign-up/sign-in/sign-out functionality. I accomplished that part soon, the part where I lost time in iteration 5 when I  was switching over traditional CRUD interface to a JQuery front end. I broke most of my tests and functionality. So in the future I would've just wrote the JavaScript portion of it upfront and tested accordingly.

## Iteration 1 - Sign Up, Sign In, and Sign Out

(Less than one hour.)

As an _unauthenticated_ user, when I visit the root of the application, I should be redirected to a page which prompts me to "Log In or Sign Up".

**Nota Bene**: You should aim to complete user auth in the simplest way possible. Using Rails' built-in `has_secure_password` functionality is the most straightforward and recommended way to implement this.

### Sign Up

If I click "Sign Up", I should be taken to a user form where I can
enter an **email address**, a **password**, and a **password confirmation**.

- I cannot sign up with an email address that has already been used.
- Password and confirmation must match.

Upon submitting this information, I should be logged in via a cookie and redirected to the "Links Index" page.

### Sign Out

As an authenticated user viewing the index page, I should see a link to "Sign Out". This should clear my cookies and redirect me back to the login page.

## Iteration 2 - Submitting and Viewing Links

(This section will be testing your basic Rails
CRUD abilities, with some validation logic thrown in.
Aim to complete this section in 90 minutes or less.)

As an _authenticated user_ viewing the main page (`links#index`),
I should see a simple form to submit a link.

The `Link` model should include:

- A _valid_ URL location for the link
- A title for the link

Additionally, all links have a `read` status that is either true or false. This column will default to `false`.

Submitting an invalid link should result in an error message being
displayed.

**Hint:** Use Ruby's built in `URI.parse` method to determine if a
link is a valid URL or not. This [StackOverflow post][urip] has more information. Alternatively, you could use a gem like [this one][vurl].

[urip]: http://stackoverflow.com/questions/7167895/whats-a-good-way-to-validate-links-urls-in-rails
[vurl]: https://github.com/perfectline/validates_url

Once a link has been submitted, loading the index page should
display all of _my_ links.

## Iteration 3 - Updating Link Status

(Aim to complete this section in 30-45 minutes.)

As an authenticated user who has added links to my Thoughtbox,
when I view the link index:

- Next to each unread link I should see an option to "Mark as Read".
  - Clicking this should update the link appropriately and take me immediately back to the my links.
- Next to each read link I should see an option to "Mark as Unread".
  - Clicking this should update the link appropriately and take me immediately back to the my links.
- Read links should be stylistically differentiated from unread links. You could gray them out or use a strike through.

**Note**: Later iterations will require that you be able to update the status of the link _without_ reloading the page. Depending on your approach, it might be easier to implement that now.

### Iteration 4 - Editing Links

(Aim to complete this section in 45 minutes.)

As an authenticated user who has added links to my Thoughtbox,
when I view the link index:

- Each link has an "Edit" button that either takes me to a page to edit the link or allows me to edit the link in place.
- I can edit the title or the URL of the link.
- I cannot change the URL to an invalid URL.

### Iteration 5 - Client-side

(Aim to complete this section in one hour.)

As an authenticated user, I can do the following in the link index without reloading the page:

- Mark a link as read or unread
- Filter the list of links by a search term
- Filter the list by status (e.g. "read" and "unread")
- Sort the list alphabetically
