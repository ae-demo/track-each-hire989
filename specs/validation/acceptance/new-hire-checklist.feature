Feature: New hire checklist creation

  @story-1
  Rule: A new hire is recorded with a start date

    Scenario: HR adds a new hire
      Given no record exists for "Dana Kim"
      When Priya the HR Coordinator adds new hire "Dana Kim" with start date "2026-10-01"
      Then "Dana Kim" appears in the list of new hires with start date "2026-10-01"

  @story-2
  Rule: Adding a new hire instantiates the standard checklist across IT, HR and Facilities

    Scenario: Tasks appear the moment the new hire is added
      Given the standard checklist template has tasks for HR, IT and Facilities
      When Priya the HR Coordinator adds new hire "Sam Lee" with start date "2026-10-06"
      Then "Sam Lee" has an open task in HR, an open task in IT, and an open task in Facilities

  @story-3
  Rule: HR maintains the standard checklist template

    Scenario: HR adds a template task
      Given the standard checklist template exists
      When Priya the HR Coordinator adds a template task "Ship welcome kit" for Facilities at offset "-2" days
      Then the checklist template includes "Ship welcome kit" for Facilities

    Scenario: HR removes a template task
      Given the standard checklist template has a task "Order business cards" for Facilities
      When Priya the HR Coordinator removes the template task "Order business cards"
      Then the checklist template no longer includes "Order business cards"

    @negative
    Scenario: A template task change does not affect an already-onboarded new hire
      Given "Priya Rao" was onboarded before the template task "Ship welcome kit" was added
      When Priya the HR Coordinator adds a template task "Ship welcome kit" for Facilities at offset "-2" days
      Then "Priya Rao" still has the same number of Facilities tasks as before

  @story-4
  Rule: HR may add a one-off task to a specific new hire without changing the template

    Scenario: HR adds an exception task
      Given "Dana Kim" is a new hire with an open checklist
      When Priya the HR Coordinator adds a one-off IT task "Ship extra monitor" due "2026-10-03" to "Dana Kim"
      Then "Dana Kim" has an open IT task "Ship extra monitor" due "2026-10-03"
      And the standard checklist template is unchanged

  @story-5
  Rule: HR sees every new hire's onboarding status across all three departments

    Scenario: HR views cross-department status
      Given "Dana Kim" has a mix of open and complete tasks across HR, IT and Facilities
      When Priya the HR Coordinator opens the onboarding dashboard
      Then she sees "Dana Kim"'s task status for HR, IT and Facilities
