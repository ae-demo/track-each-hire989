Feature: Overdue tracking and reminders

  @story-6
  Rule: HR sees every overdue task across all new hires and departments

    Scenario: HR views the overdue list
      Given "Sam Lee" has an IT task "Prepare laptop" due "2026-09-20" that is still open
      And today is after "2026-09-20"
      When Priya the HR Coordinator opens the overdue tasks view
      Then she sees "Prepare laptop" for "Sam Lee" in the overdue list

    @negative
    Scenario: A completed task never appears as overdue
      Given "Sam Lee" has an IT task "Prepare laptop" due "2026-09-20" that has been marked complete
      And today is after "2026-09-20"
      When Priya the HR Coordinator opens the overdue tasks view
      Then she does not see "Prepare laptop" for "Sam Lee" in the overdue list

  @story-12
  Rule: A task becomes overdue the moment its due date passes without being marked complete

    Scenario: An open task past its due date is flagged
      Given "Sam Lee" has a Facilities task "Assign desk" due "2026-09-22" that is still open
      When today is after "2026-09-22"
      Then "Assign desk" for "Sam Lee" is counted among the overdue tasks

  @story-12
  Rule: The owning department is reminded daily until an overdue task is completed

    Scenario: A reminder goes out for a still-open overdue task
      Given "Sam Lee" has an IT task "Prepare laptop" that became overdue yesterday and is still open
      When the daily reminder run happens
      Then IT receives a reminder email naming "Prepare laptop" for "Sam Lee"

    Scenario: Reminders stop once the task is completed
      Given "Sam Lee" has an IT task "Prepare laptop" that was overdue but has now been marked complete
      When the daily reminder run happens
      Then IT receives no reminder email for "Prepare laptop" for "Sam Lee"
