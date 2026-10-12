# CRM Campaign Analytics
## Marketing Opt-Out Validation

### Business Question
Were customers included in marketing campaigns
after previously opting out?

### SQL Method
Used INNER JOIN and a self-join to compare
historical customer campaign activity.

### Dataset
12 synthetic customers
18 campaign activity records

### Findings
One customer had campaign activity recorded
after an earlier opt-out.

Customer ID: 1006

### Business Risk
Potential inappropriate marketing contact.

### Recommendation
Investigate the customer's consent history,
opt-out scope and communication preferences.

### Limitations
The dataset does not contain detailed consent
records or communication channel information.

The finding does not establish a legal violation.

### Conclusion
SQL validation can help identify customer
records requiring investigation before
future marketing campaigns.