# Overdue reminder

Every day, the onboarding API finds open tasks past their due date and emails
a reminder to the owning department; HR can see every overdue task across
departments in one place.

```mermaid
sequenceDiagram
    actor HR as HR Coordinator
    participant onboarding-api
    participant email-service
    participant onboarding-webapp

    onboarding-api-->>onboarding-api: find open tasks past due date
    onboarding-api->>email-service: send overdue reminder
    email-service-->>onboarding-api: sent

    HR->>onboarding-webapp: open overdue tasks view
    onboarding-webapp->>onboarding-api: list overdue tasks (every department)
    onboarding-api-->>onboarding-webapp: overdue tasks
```

