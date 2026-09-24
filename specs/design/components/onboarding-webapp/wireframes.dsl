screen HRDashboard "Cross-department onboarding status"
  navbar "Onboarding Tracker"
  sidebar "Dashboard -> HRDashboard | New Hires -> NewHiresList | Checklist Template -> ChecklistTemplate | Overdue Tasks -> OverdueTasks | My HR Tasks -> HRTaskQueue"
  row
    card "New hires | 12 | onboarding now"
    card "Open tasks | 34 | across departments"
    card "Overdue | 5 | need attention -> OverdueTasks"
  heading "Recent new hires"
  table "Name | Start Date | HR | IT | Facilities" -> NewHireDetail
    row "Dana Kim | 2026-10-01 | 2/3 | 1/2 | 0/1"
    row "Sam Lee | 2026-10-06 | 3/3 | 2/2 | 1/1"

screen NewHiresList "Every new hire"
  navbar "Onboarding Tracker"
  sidebar "Dashboard -> HRDashboard | New Hires -> NewHiresList | Checklist Template -> ChecklistTemplate | Overdue Tasks -> OverdueTasks | My HR Tasks -> HRTaskQueue"
  row
    heading "New Hires"
    right
    button "Add New Hire" primary -> AddNewHire
  table "Name | Start Date | Status" -> NewHireDetail
    row "Dana Kim | 2026-10-01 | In progress"
    row "Sam Lee | 2026-10-06 | In progress"
    row "Priya Rao | 2026-09-20 | Complete"

screen AddNewHire "Add a new hire and start their checklist"
  navbar "Onboarding Tracker"
  heading "Add New Hire"
  input "Full name"
  input "Start date"
  row
    right
    button "Cancel" -> NewHiresList
    button "Add New Hire" primary -> NewHireDetail

screen NewHireDetail "One new hire's tasks across all departments"
  navbar "Onboarding Tracker"
  sidebar "Dashboard -> HRDashboard | New Hires -> NewHiresList | Checklist Template -> ChecklistTemplate | Overdue Tasks -> OverdueTasks | My HR Tasks -> HRTaskQueue"
  heading "Dana Kim"
  text "Start date: 2026-10-01"
  row
    right
    button "Add One-off Task" primary -> AddAdHocTask
  table "Department | Task | Due | Status"
    row "HR | Collect signed offer | 2026-09-28 | Complete"
    row "IT | Prepare laptop | 2026-09-28 | Open"
    row "Facilities | Assign desk | 2026-09-30 | Open"

screen AddAdHocTask "Add a one-off task for this new hire"
  navbar "Onboarding Tracker"
  heading "Add One-off Task"
  select "Department"
  input "Task title"
  input "Due date"
  row
    right
    button "Cancel" -> NewHireDetail
    button "Add Task" primary -> NewHireDetail

screen ChecklistTemplate "The standard checklist every new hire gets"
  navbar "Onboarding Tracker"
  sidebar "Dashboard -> HRDashboard | New Hires -> NewHiresList | Checklist Template -> ChecklistTemplate | Overdue Tasks -> OverdueTasks | My HR Tasks -> HRTaskQueue"
  row
    heading "Checklist Template"
    right
    button "Add Template Task" primary -> AddTemplateTask
  table "Department | Task | Offset from Start"
    row "HR | Collect signed offer | -3 days"
    row "IT | Prepare laptop | -3 days"
    row "IT | Create accounts | -1 day"
    row "Facilities | Assign desk | -1 day"
    row "Facilities | Issue badge | 0 days"

screen AddTemplateTask "Add a task to the standard checklist"
  navbar "Onboarding Tracker"
  heading "Add Template Task"
  select "Department"
  input "Task title"
  input "Offset from start date (days)"
  row
    right
    button "Cancel" -> ChecklistTemplate
    button "Save" primary -> ChecklistTemplate

screen OverdueTasks "Every overdue task, any department"
  navbar "Onboarding Tracker"
  sidebar "Dashboard -> HRDashboard | New Hires -> NewHiresList | Checklist Template -> ChecklistTemplate | Overdue Tasks -> OverdueTasks | My HR Tasks -> HRTaskQueue"
  heading "Overdue Tasks"
  table "New Hire | Department | Task | Due Date" -> NewHireDetail
    row "Sam Lee | IT | Prepare laptop | 2026-09-20"
    row "Sam Lee | Facilities | Assign desk | 2026-09-22"

screen HRTaskQueue "HR's own onboarding tasks"
  navbar "Onboarding Tracker"
  sidebar "Dashboard -> HRDashboard | New Hires -> NewHiresList | Checklist Template -> ChecklistTemplate | Overdue Tasks -> OverdueTasks | My HR Tasks -> HRTaskQueue"
  heading "My HR Tasks"
  table "New Hire | Task | Due Date | Status"
    row "Dana Kim | Collect signed offer | 2026-09-28 | Open"
  checkbox "Mark selected complete"
  button "Complete Selected" primary

screen ITTaskQueue "IT's onboarding tasks across every new hire"
  navbar "Onboarding Tracker"
  sidebar "My Tasks -> ITTaskQueue"
  heading "IT Onboarding Tasks"
  table "New Hire | Task | Due Date | Status"
    row "Dana Kim | Prepare laptop | 2026-09-28 | Open"
    row "Sam Lee | Prepare laptop | 2026-09-20 | Open"
    row "Sam Lee | Create accounts | 2026-10-05 | Open"
  button "Mark Complete" primary

screen FacilitiesTaskQueue "Facilities' onboarding tasks across every new hire"
  navbar "Onboarding Tracker"
  sidebar "My Tasks -> FacilitiesTaskQueue"
  heading "Facilities Onboarding Tasks"
  table "New Hire | Task | Due Date | Status"
    row "Dana Kim | Assign desk | 2026-09-30 | Open"
    row "Sam Lee | Assign desk | 2026-09-22 | Open"
    row "Sam Lee | Issue badge | 2026-10-06 | Open"
  button "Mark Complete" primary

flow "Manage onboarding"
  role "HR Coordinator"
  description "HR adds a new hire, watches status across departments, and keeps the checklist template current"
  HRDashboard
  NewHiresList
  AddNewHire
  NewHireDetail
  AddAdHocTask
  ChecklistTemplate
  AddTemplateTask
  OverdueTasks
  HRTaskQueue

flow "IT task queue"
  role "IT Staff"
  description "IT staff work through their onboarding tasks for every new hire"
  ITTaskQueue

flow "Facilities task queue"
  role "Facilities Staff"
  description "Facilities staff work through their onboarding tasks for every new hire"
  FacilitiesTaskQueue
