# n8n-workflow-architect

## Overview
A pre-implementation discussion and planning skill for n8n workflows that emphasizes critical thinking and iterative refinement to minimize workflow re-iterations and failures.

## Activation Patterns
- "Let's discuss this n8n workflow"
- "Plan an n8n automation for"
- "Think through this workflow requirement"
- "Analyze before building"
- "Design an n8n workflow"
- "I need to automate" (when discussing n8n)
- "Help me plan a workflow"
- "What's the best approach for" (in n8n context)

## Core Workflow Lifecycle
**Think → Plan → Build → Validate → Execute → (Retry if failed)**

This skill focuses on the **Think & Plan** phases to minimize the costly retry loop.

## Execution Flow

### Phase 1: Documentation Fetch (MANDATORY)
**ALWAYS start by fetching the latest n8n documentation using Context7 MCP:**

```
1. Use mcp__context7__resolve-library-id with "n8n" to get library ID
2. Use mcp__context7__get-library-docs to fetch:
   - Core workflow concepts
   - Node APIs and configurations
   - Authentication patterns
   - Expression syntax
   - Error handling strategies
```

### Phase 2: Requirements Analysis
**Use iterative discussion to gather and refine requirements:**

1. **Initial Requirements Gathering**
   - What is the business goal?
   - What systems need to integrate?
   - What data needs to flow between systems?
   - What triggers the workflow?
   - What's the expected output?

2. **Technical Decomposition**
   - Map business requirements to n8n capabilities
   - Identify required nodes and services
   - Document data transformations needed
   - List authentication requirements
   - Define success criteria

### Phase 3: Critical Thinking with SequentialThinking MCP
**Activate mcp__sequentialthinking__sequentialthinking for structured analysis:**

```json
{
  "thought": "Analyzing workflow requirements...",
  "nextThoughtNeeded": true,
  "thoughtNumber": 1,
  "totalThoughts": 12,
  "isRevision": false
}
```

**Thinking Framework (10-15 thoughts):**
1. **Requirements validation** - Are requirements complete and clear?
2. **Data flow analysis** - How will data move through the workflow?
3. **Authentication check** - What credentials are needed?
4. **Node selection** - Which nodes best fit the requirements?
5. **Edge case identification** - What could go wrong?
6. **Error handling strategy** - How to handle failures?
7. **Performance considerations** - Rate limits, pagination, timeouts?
8. **Testing approach** - How to validate the workflow?
9. **Security review** - Any security concerns?
10. **Alternative approaches** - Is there a better way?
11. **Hypothesis generation** - Propose the solution
12. **Hypothesis verification** - Validate against requirements

### Phase 4: Iterative Discussion & Refinement
**Keep the discussion iterative to bring out the best workable plan:**

1. **Present Initial Plan**
   ```
   Based on analysis, here's my initial workflow design:
   - Trigger: [webhook/schedule/manual]
   - Node sequence: [list nodes in order]
   - Data flow: [describe transformations]
   - Error handling: [strategy]
   ```

2. **Gather Feedback**
   - "Does this meet your requirements?"
   - "Any concerns about this approach?"
   - "What edge cases should we consider?"

3. **Refine Plan**
   - Incorporate feedback
   - Adjust node selection if needed
   - Enhance error handling
   - Add missing requirements

4. **Iterate Until Optimal**
   - Continue refining until user is satisfied
   - Document all decisions and rationale

### Phase 5: Architecture Documentation
**Create comprehensive plan before building:**

```markdown
## Workflow Architecture

### Overview
[Business goal and high-level description]

### Trigger
- Type: [Webhook/Schedule/Manual/etc]
- Configuration: [specific settings]
- Frequency: [if applicable]

### Node Sequence
1. **[Node Name]** (node-type)
   - Purpose: [what it does]
   - Configuration: [key settings]
   - Input: [expected data]
   - Output: [produced data]

### Data Flow
- Source format: [JSON/CSV/XML/etc]
- Transformations: [list of changes]
- Target format: [final structure]

### Authentication
- Service 1: [auth method]
- Service 2: [auth method]

### Error Handling
- Node failures: [strategy]
- Data validation: [approach]
- Retry logic: [configuration]

### Testing Plan
- Test scenario 1: [description]
- Test scenario 2: [description]
- Edge case tests: [list]

### Success Criteria
- [ ] Requirement 1 met
- [ ] Requirement 2 met
- [ ] Performance targets achieved
```

## Integration with Other n8n Skills

After planning is complete, hand off to:
1. **n8n-workflow-patterns** - Select appropriate pattern
2. **n8n-node-configuration** - Configure nodes properly
3. **n8n-expression-syntax** - Write expressions
4. **n8n-validation-expert** - Validate configuration
5. **n8n-mcp-tools-expert** - Build and deploy

## Common Patterns & Solutions

### Pattern 1: Webhook to Database
```
Webhook → Validate → Transform → Database → Respond
```
**Considerations:** Data validation, SQL injection prevention, response handling

### Pattern 2: Scheduled Data Sync
```
Schedule → Fetch Source → Compare → Update Target → Log
```
**Considerations:** Pagination, deduplication, error recovery

### Pattern 3: Event-Driven Integration
```
Trigger → Filter → Enrich → Route → Process → Notify
```
**Considerations:** Event filtering, data enrichment sources, routing logic

### Pattern 4: File Processing Pipeline
```
File Trigger → Parse → Validate → Transform → Store → Clean
```
**Considerations:** File formats, size limits, cleanup strategy

### Pattern 5: API Orchestration
```
Trigger → Auth → Call API 1 → Transform → Call API 2 → Aggregate → Return
```
**Considerations:** Rate limits, timeout handling, data aggregation

## Edge Cases Checklist

### Data Issues
- [ ] Empty/null data handling
- [ ] Malformed data recovery
- [ ] Data type mismatches
- [ ] Character encoding issues
- [ ] Large data volume handling

### System Issues
- [ ] API unavailability
- [ ] Network timeouts
- [ ] Rate limiting
- [ ] Authentication expiry
- [ ] Quota exhaustion

### Business Logic
- [ ] Duplicate processing prevention
- [ ] Order dependency handling
- [ ] Timezone considerations
- [ ] Business rule violations
- [ ] Partial success scenarios

## Best Practices

### Always Do
- ✅ Fetch latest docs with Context7 first
- ✅ Use sequentialthinking for complex analysis
- ✅ Iterate discussion until plan is solid
- ✅ Document all decisions and rationale
- ✅ Consider edge cases upfront
- ✅ Plan error handling strategy
- ✅ Create test scenarios before building

### Never Do
- ❌ Skip documentation fetch
- ❌ Rush to implementation
- ❌ Ignore edge cases
- ❌ Assume happy path only
- ❌ Skip iterative refinement
- ❌ Overlook authentication needs
- ❌ Forget about rate limits

## Example Activation

```
User: "I need to sync Salesforce leads to Slack when they're created"