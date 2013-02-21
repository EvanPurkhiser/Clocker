# Clocker - A timekeeping web application

Over the past few years, I've worked on a number of small and large freelancing
and contracting projects. Each time, the question always comes up of how I will
keep track of the time I've spent working on a project, and conversely how will
I create a nice looking invoice for my client?

As any software hacker worth their salt, I've cobbled together a 'process' to
keep track of my time as well as create invoices from this data. Unfortunately,
it involves a lot of Microsoft Excel and Word, the results don't look terrible
but the whole process of clocking in and clocking out just really isn't that
enjoyable. I want to change that.

## Solving problems with fun and code

This is where *Clocker* comes in. Clocker is my idea for a web application that
can be used to keep track of your time spent working on various projects, and
when ready, generate invoices from the tracked time.

### Putting the 'Clock' in Clocker

The primary feature of this web application is to keep track of the time spent
working on a project. A project will have many different entires for each of
the different times that you've spent working on a project.

Now this is where the convenience factor comes into play. Clocker will have a
very clean and intuitive interface for entering in the times you've spent
working on a project. The primary way to do this will be through the clocking
interface, where you can essentially clock in and then out of a project, keeping
track of the exact amount of time that you've spent working for a particular
period. You can also manually make an entry, where you enter the date and time
that you started working, and the time that you finished working.

A timed entry will also have some other information associated with it. One of
these being a "tag" for the entry. For each of your projects you will be able
to globally define a set of tags that you can use to tag your clocked entries
with. An example of what you might tag your entries with might be "Programming"
or "Consulting". For each of these different tags you'll be able to set the
hourly rate to charge for that type of work done, this will then be used to
calculate the total amount to bill for.

Finally, and perhaps one of the most important parts of an entry will be the
ability to add a subject and description for an entry. This will allow you
to be specific and describe exactly what you spent your time working on.


### Pretty invoices make clients happy

The next key feature of the Clocker application is the ability to generate
invoices for a project. Invoices can be generated from either a specified date
range, or from the most recent entry up until the previous invoice. The invoice
itself will include all of the standard details about the person doing the work,
which can be configured in the users profile, as well as details about the
project, which can be configured on a per project basis. These details will all
be editable before the invoice itself is generated.

It will be possible to generate both a PDF invoice as well as a HTML invoice
that you will be able to generate a public permalink that can be sent to the
client.

Both the PDF and the HTML invoice views should take a minimalistic, clean, and
professional approach to displaying the time entries. Some customization may
be allowed such as providing a letter head logo and the like on the invoice.

### Keeping a history keeps you accountable

The final feature I would like to implement is a way to keep track of changes
that are made to the work entries. Each revision of a work entry should be kept
in the system, as well as a snapshot of the entire entry list each time a entry
is changed. This is a good way to ensure accountability of the hours worked, and
provides a good way to keep accountability for the time worked.

This feature is interesting to me because it will allow me to design a system
similar to source revision control that keeps track of content and changes.

## Technologies and Implementation

I am by no means new to developing web applications, in fact, It's what I do for
a living. However, what I am quite new to is the Ruby language as well as the
Ruby on Rails framework. The primary goal of this project is not only to create
something that solves a problem I have, but also to begin to get a grasp on the
Ruby language.

I would like to also spend some time on this project playing around with a few
other new and interesting technologies and frameworks that have surfaced in the
recent years such as Bootstrap.css and possible a JavaScript framework like
Backbone, AngularJS, Require.js, etc...

Finally, I will be using GitHub to manage manage project issues and features,
as well as a place to store my source code publicly for the project. You can
find the current GitHub repository located at
https://github.com/EvanPurkhiser/Clocker

## Project Schedule

Here I've outlined what features I would like to have completed for each of
the milestones

### Milestone 3

By this time I would like to have the following completed

 * Basic understanding of the Rails framework as well as the Ruby language
 * Basic web application configured and working
 * Ability to register and login
 * Basic layout made using Bootstrap.css
 * The ability to clock in and clock out and fill in details for an entry

### Milestone 4

By this time I would like to have the following completed

 * The ability to fill out project details and user details
 * Functionality of the HTML and PDF invoice generator
 * Ability to permalink to a invoice
 * Functionality for history/revision management of time entries
 * Ability to manually add in entries

### Milestone 5

At this point hopefully everything is working "good enough" and I can begin to
polish everything up and fix small bugs and user interface quirks.
