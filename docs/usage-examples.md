# Usage Examples

Real-world examples of using the n8n-workflow-architect skill to plan workflows before implementation.

## Example 1: Customer Support Ticket Automation

### User Request
"I need to automate our customer support workflow. When a ticket comes in via email, it should be categorized, assigned to the right team, and create tasks in our project management tool."

### Skill Activation & Response

#### Phase 1: Documentation Fetch
```
Fetching latest n8n documentation for:
- Email nodes (Gmail, IMAP)
- AI nodes (OpenAI for categorization)
- Project management nodes (Jira, Asana, ClickUp)
```

#### Phase 2: Iterative Discussion
```
Claude: Let me understand your requirements better:

1. What's your email source? (Gmail, Office 365, IMAP server?)
2. What project management tool do you use?
3. How should tickets be categorized? (by keywords, AI, rules?)
4. What are your team assignment rules?
5. What should happen with attachments?
6. How should urgent tickets be handled?
```

#### Phase 3: Critical Thinking (via SequentialThinking)
```
Thought 1: Analyzing email ingestion methods...
Thought 2: Evaluating categorization approaches (keyword vs AI)...
Thought 3: Considering rate limits for project management API...
Thought 4: Identifying edge case: duplicate tickets...
Thought 5: Planning error handling for API failures...
...
Thought 12: Generating hypothesis: Email trigger → AI categorize → Route → Create task
```

#### Phase 4: Workflow Plan
```markdown
## Workflow Architecture

### Trigger
- **Gmail Trigger** (new email in support inbox)
  - Poll interval: 1 minute
  - Label: "unprocessed"

### Node Sequence
1. **Gmail Trigger** → Receives email
2. **OpenAI Chat** → Categorizes (bug/feature/question)
3. **IF Node** → Routes by category
4. **Set Node** → Enriches with metadata
5. **Jira Node** → Creates issue
6. **Gmail Node** → Marks as processed

### Error Handling
- OpenAI failure: Default to "uncategorized"
- Jira API limit: Queue and retry
- Invalid email format: Send to manual review

### Test Scenarios
- Normal email with clear category
- Email with attachments
- Duplicate ticket detection
- API rate limit handling
```

## Example 2: E-commerce Order Fulfillment

### User Request
"Automate order processing from Shopify to our warehouse system, update inventory, and notify customers."

### Workflow Plan After Analysis

```markdown
## Workflow Architecture

### Triggers (2 workflows)
1. **Webhook** - Shopify order.created
2. **Schedule** - Inventory sync every 30 min

### Main Order Workflow
1. **Shopify Webhook** → Receive order
2. **Code Node** → Validate order data
3. **HTTP Request** → Check warehouse stock
4. **Switch Node** → Route by stock status
   - In Stock → Create fulfillment
   - Low Stock → Alert + Fulfill
   - No Stock → Backorder flow
5. **Database** → Log transaction
6. **Email** → Customer notification

### Edge Cases Handled
- Partial fulfillment for multi-item orders
- Payment verification before fulfillment
- International shipping restrictions
- Warehouse API timeout (retry with backoff)
- Duplicate webhook prevention

### Data Transformations
- Shopify format → Warehouse format mapping
- Currency conversion for international
- SKU normalization between systems
```

## Example 3: Social Media Content Pipeline

### User Request
"I want to automatically post blog content to all our social media channels with customized formats for each platform."

### Critical Analysis & Plan

```markdown
## Identified Challenges (via SequentialThinking)
1. Platform-specific content requirements
2. Image resizing for different platforms
3. Character limits (Twitter/X)
4. Hashtag strategies per platform
5. Scheduling for optimal times
6. Rate limiting per platform

## Workflow Architecture

### Trigger
- **RSS Feed** (new blog post)
- **Manual** (for testing)

### Processing Pipeline
1. **RSS Trigger** → Detect new post
2. **HTTP Request** → Fetch full content
3. **Code Node** → Extract and process:
   - Title, excerpt, images
   - Generate hashtags
   - Create platform variants
4. **Parallel Processing**:
   - Twitter/X: Truncate + thread if needed
   - LinkedIn: Professional tone + full link
   - Instagram: Focus on visual + story format
   - Facebook: Full excerpt + engagement CTA
5. **Delay Node** → Stagger posts (5 min apart)
6. **Google Sheets** → Log published content

### Platform-Specific Configurations
- Twitter: 280 chars, 4 images max
- LinkedIn: 3000 chars, professional hashtags
- Instagram: Square images, 30 hashtags max
- Facebook: Open graph optimization

### Error Recovery
- Failed platform: Retry 3x, then notify
- Image processing failure: Use default
- API changes: Graceful degradation
```

## Example 4: Data Pipeline with Quality Checks

### User Request
"Build a daily data sync from multiple databases to our data warehouse with quality checks and alerting."

### Comprehensive Plan

```markdown
## Multi-Source Data Pipeline

### Sources Identified
1. PostgreSQL (customers)
2. MongoDB (transactions)
3. REST API (inventory)
4. CSV on FTP (vendor data)

### Architecture Decision (after discussion)
- Incremental sync (not full replace)
- CDC for PostgreSQL using timestamps
- Batch processing for large datasets
- Parallel extraction where possible

### Workflow Design

#### Main Orchestrator Workflow
1. **Schedule Trigger** → 2 AM daily
2. **Parallel Execute**:
   - Sub-workflow: PostgreSQL sync
   - Sub-workflow: MongoDB sync
   - Sub-workflow: API sync
   - Sub-workflow: FTP sync
3. **Wait Node** → All complete
4. **Execute Workflow** → Quality checks
5. **IF Node** → Quality pass?
   - Yes: Send success report
   - No: Rollback + alert

#### Quality Check Workflow
1. **Database Query** → Row counts
2. **Code Node** → Statistical checks:
   - Record count variance (>10% = flag)
   - Null percentage thresholds
   - Duplicate detection
   - Referential integrity
3. **Generate Report** → Markdown format
4. **Decision** → Pass/Fail

### Edge Cases & Solutions
- Source DB timeout: Implement chunking
- Memory issues: Stream processing
- Schema changes: Auto-detection + alert
- Partial failures: Transaction logs
- Time zone issues: UTC normalization
```

## Example 5: AI-Powered Document Processing

### User Request
"Process incoming invoices: extract data, validate, enter into accounting system, and handle exceptions."

### Iterative Planning Result

```markdown
## Document Intelligence Workflow

### Discovered Requirements (through discussion)
- 50-100 invoices daily
- Multiple formats (PDF, images, emails)
- Multi-language support needed
- Compliance requirements (audit trail)
- Approval workflow for >$10,000

### Technical Architecture

#### Phase 1: Ingestion
1. **Multi-Trigger Setup**:
   - Email attachment monitor
   - Cloud storage webhook
   - Manual upload endpoint
2. **File Router** → By type

#### Phase 2: Extraction
3. **AI Document Node** (OpenAI Vision):
   - Extract: vendor, amount, date, items
   - Confidence scoring
4. **Validation Node**:
   - Schema validation
   - Business rules (date logic, amounts)
   - Duplicate detection

#### Phase 3: Processing
5. **Switch Node** (by confidence):
   - High (>90%): Auto-process
   - Medium (70-90%): Human review
   - Low (<70%): Manual entry
6. **QuickBooks Node**: Create entry
7. **Approval Workflow** (if >$10,000)

#### Phase 4: Exception Handling
- OCR failure: Route to manual queue
- Validation failure: Detailed error report
- API failure: Retry queue with backoff
- Duplicate invoice: Alert + investigate

### Performance Optimizations
- Batch API calls (reduce quota usage)
- Cache vendor data (reduce lookups)
- Parallel OCR processing
- Smart retry logic

### Compliance & Audit
- Full audit log in database
- Original document archival
- Processing history tracking
- Error documentation
```

## Best Practices Demonstrated

### 1. Always Start with Questions
- Don't assume requirements
- Clarify ambiguities upfront
- Understand the business context

### 2. Think Through Edge Cases
- What if the API is down?
- What if data is malformed?
- What about rate limits?
- How to handle duplicates?

### 3. Plan Data Transformations
- Map source to target formats
- Handle data type conversions
- Plan for missing fields
- Consider data validation

### 4. Design for Failure
- Every external call can fail
- Plan retry strategies
- Create fallback paths
- Log everything for debugging

### 5. Consider Performance
- Batch vs. individual processing
- Parallel vs. sequential execution
- Memory usage for large datasets
- API rate limits and quotas

### 6. Test Scenarios First
- Define success criteria
- Create test data sets
- Plan edge case tests
- Document expected outcomes

## Common Patterns

### Pattern: Webhook with Validation
```
Webhook → Validate → Process → Respond
         ↓ (invalid)
         Error Response
```

### Pattern: Batch Processing with Error Queue
```
Schedule → Fetch Batch → Process Items → Success Log
                        ↓ (failures)
                        Error Queue → Retry Logic
```

### Pattern: Multi-Source Aggregation
```
Source 1 →\
Source 2 → → Merge → Transform → Destination
Source 3 →/
```

### Pattern: Approval Workflow
```
Trigger → Process → Condition → Auto-Approve
                   ↓ (needs approval)
                   Human Task → Approval → Continue
```

## Tips for Using the Skill

1. **Be Specific**: The more details you provide, the better the plan
2. **Ask Questions**: If the skill asks for clarification, provide detailed answers
3. **Review Iteratively**: Don't accept the first plan if it doesn't feel right
4. **Consider Scale**: Mention expected volumes for proper architecture
5. **State Constraints**: Budget, time, technical limitations
6. **Provide Context**: Business goals help shape technical decisions

## Conclusion

The n8n-workflow-architect skill transforms ad-hoc workflow building into a structured, thoughtful process. By thinking through requirements, edge cases, and architecture before building, you save hours of debugging and re-work.