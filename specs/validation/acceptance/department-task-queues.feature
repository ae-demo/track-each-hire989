Feature: Department task queues

  @story-7
  Rule: IT Staff sees the IT onboarding tasks for every new hire

    Scenario: IT views its queue
      Given "Dana Kim" has an open IT task "Prepare laptop"
      And "Sam Lee" has an open IT task "Create accounts"
      When Ian the IT Staff member opens the IT task queue
      Then he sees "Prepare laptop" for "Dana Kim" and "Create accounts" for "Sam Lee"

    @negative
    Scenario: IT does not see HR or Facilities tasks in its queue
      Given "Dana Kim" has an open HR task "Collect signed offer" and an open Facilities task "Assign desk"
      When Ian the IT Staff member opens the IT task queue
      Then he does not see "Collect signed offer" or "Assign desk" in the IT task queue

  @story-8
  Rule: IT Staff marks an IT task complete

    Scenario: Completing an IT task
      Given "Dana Kim" has an open IT task "Prepare laptop"
      When Ian the IT Staff member marks "Prepare laptop" complete for "Dana Kim"
      Then "Prepare laptop" for "Dana Kim" shows as complete

  @story-9
  Rule: Facilities Staff sees the Facilities onboarding tasks for every new hire

    Scenario: Facilities views its queue
      Given "Dana Kim" has an open Facilities task "Assign desk"
      And "Sam Lee" has an open Facilities task "Issue badge"
      When Farah the Facilities Staff member opens the Facilities task queue
      Then she sees "Assign desk" for "Dana Kim" and "Issue badge" for "Sam Lee"

  @story-10
  Rule: Facilities Staff marks a Facilities task complete

    Scenario: Completing a Facilities task
      Given "Dana Kim" has an open Facilities task "Assign desk"
      When Farah the Facilities Staff member marks "Assign desk" complete for "Dana Kim"
      Then "Assign desk" for "Dana Kim" shows as complete

  @story-11
  Rule: HR Coordinator marks an HR task complete

    Scenario: Completing an HR task
      Given "Dana Kim" has an open HR task "Collect signed offer"
      When Priya the HR Coordinator marks "Collect signed offer" complete for "Dana Kim"
      Then "Collect signed offer" for "Dana Kim" shows as complete
