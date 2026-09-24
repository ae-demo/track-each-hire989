# track-each-hire989 — PRD

## Problem Statement

When a new employee joins, their onboarding work is split across HR, IT and
Facilities — HR paperwork, IT provisioning (laptop, accounts), and Facilities
setup (badge, desk). Today these tasks are tracked informally by email and
spreadsheets, so nobody has a single view of what is done, what is late, and
who owns it. Overdue items go unnoticed until the new hire's first day arrives
and something is missing.

## Solution

A shared onboarding tracker that, the moment a new hire is added, spins up a
standard checklist of tasks split across IT, HR and Facilities. Each
department works its own queue, HR sees the whole picture across every new
hire, and anyone with an overdue task gets a reminder until it is done.

## Actors

- **HR Coordinator** — adds new hires, triggers their onboarding checklist,
can view and manage every task across all three departments, maintains the
standard checklist template, and sees overdue items organization-wide.
- **IT Staff** — sees and completes the IT onboarding tasks assigned for each
new hire.
- **Facilities Staff** — sees and completes the Facilities onboarding tasks
assigned for each new hire.

## User Stories

1. As an HR Coordinator, I want to add a new hire with their start date, so
that their onboarding can be scheduled.
2. As an HR Coordinator, I want a standard onboarding checklist to be created
automatically across IT, HR and Facilities as soon as a new hire is added,
so that nothing is missed.
3. As an HR Coordinator, I want to maintain the standard checklist template
(add, edit or remove its tasks), so that it stays current for future hires.
4. As an HR Coordinator, I want to add a one-off task to a specific new hire's
checklist, so that exceptions are covered without changing the template.
5. As an HR Coordinator, I want to view every new hire's onboarding status
across all three departments, so that I can track overall progress.
6. As an HR Coordinator, I want to see every overdue task across all new
hires and departments, so that I can escalate what is stuck.
7. As an IT Staff member, I want to see the IT onboarding tasks assigned
across all new hires, so that I know what to work on.
8. As an IT Staff member, I want to mark an IT task complete, so that its
status reflects reality.
9. As a Facilities Staff member, I want to see the Facilities onboarding
tasks assigned across all new hires, so that I know what to work on.
10. As a Facilities Staff member, I want to mark a Facilities task complete,
so that its status reflects reality.
11. As an HR Coordinator, I want to mark an HR task complete, so that its
status reflects reality.
12. As an HR Coordinator, IT Staff member, or Facilities Staff member, I want
to receive a reminder when a task assigned to my department becomes
overdue, so that I can act on it.

## Product Decisions

- Sign-in: every actor signs in through the organization's SSO (Thunder), per
the org's standing default.
- Reminders are sent by email, through the organization's internal
transactional email service (a Registered External resource of the org).
- A task is **overdue** the moment its due date passes without being marked
complete.
- Each overdue task's owning department gets one reminder per day until the
task is completed.
- Each standard checklist task carries an offset from the new hire's start
date (e.g. "3 days before start", "1 day after start"); that offset is set
once on the template and used to compute the task's due date for every new
hire.
- Departments only see and act on their own tasks; only the HR Coordinator
has a cross-department view. (From actor definition above.)
- New hires are tracked records only — they do not sign in or see the
checklist themselves. (From actor definition above.)

## Out of Scope

- New hires having any access to the system (no self-service checklist view).
- Payroll, benefits enrollment, or background-check processing.
- Integration with external HRIS, IT ticketing, or facilities-management
systems — tasks are tracked natively in this product.

## Open Questions

1. What are the actual tasks on the standard IT / HR / Facilities checklist
template? The HR Coordinator can define and maintain them (Story 3); no
specific list is assumed here.

## Further Notes

None.