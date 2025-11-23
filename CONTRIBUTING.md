# Contributing to Claude Skills Marketplace

Thank you for your interest in contributing to the Claude Skills Marketplace! This guide will help you add new skills or improve existing ones.

## 🎯 Quick Start

1. Fork the repository
2. Create your skill using our templates
3. Test your skill thoroughly
4. Submit a pull request

## 📝 Skill Development Guidelines

### 1. Planning Your Skill

Before creating a skill, ask yourself:
- What problem does this skill solve?
- Is there an existing skill that already does this?
- What makes this skill unique?
- Who is the target audience?

### 2. Creating a New Skill

#### Step 1: Copy the Template
```bash
cp -r skill-template your-skill-name
cd your-skill-name
```

#### Step 2: Rename Template Files
```bash
mv SKILL.md.template SKILL.md
mv metadata.json.template metadata.json
mv README.md.template README.md
```

#### Step 3: Fill in the Templates
- **SKILL.md**: Your skill's core logic and implementation
- **metadata.json**: Configuration and metadata
- **README.md**: User-facing documentation

### 3. Skill Structure

Every skill must have:
```
your-skill-name/
├── SKILL.md          # Required: Core implementation
├── metadata.json     # Required: Skill configuration
└── README.md        # Required: Documentation
```

Optional files:
```
├── examples.md      # Usage examples
├── config.json      # Default configuration
└── tests/          # Test cases
```

## 📋 Skill Requirements

### Mandatory Elements

1. **Unique Name**: Use lowercase with hyphens (e.g., `api-doc-generator`)
2. **Clear Activation**: Define 3-5 activation phrases
3. **Documentation**: Complete README with examples
4. **Metadata**: Valid JSON with all required fields
5. **License**: Must be MIT compatible

### Quality Standards

Your skill should:
- ✅ Have clear, specific activation patterns
- ✅ Include error handling
- ✅ Document all dependencies
- ✅ Provide at least 3 usage examples
- ✅ Follow the single responsibility principle
- ✅ Be well-tested before submission

### Naming Conventions

- **Skill Directory**: `lowercase-with-hyphens`
- **Display Name**: "Proper Case With Spaces"
- **Category**: Use existing categories when possible
- **Tags**: Maximum 5, relevant to functionality

## 🔧 Technical Guidelines

### SKILL.md Structure

```markdown
# Skill Name

## Overview
[Clear description]

## Activation Patterns
- "phrase one"
- "phrase two"

## [Rest of template sections]
```

### metadata.json Requirements

```json
{
  "name": "required",
  "version": "semantic versioning",
  "description": "required",
  "author": {
    "name": "required",
    "github": "required"
  },
  "category": "use existing categories",
  "tags": ["max", "five", "tags"],
  ...
}
```

### Categories

Use these existing categories:
- `automation`: Workflow and task automation
- `development`: Coding and development tools
- `planning`: Architecture and planning tools
- `data`: Data processing and analysis
- `integration`: API and third-party integrations

## 🧪 Testing Your Skill

Before submitting:

1. **Test Activation**
   ```
   # Test each activation phrase
   User: "[your activation phrase]"
   # Verify skill activates correctly
   ```

2. **Test Functionality**
   - Basic use cases
   - Edge cases
   - Error scenarios

3. **Test Integration**
   - With required dependencies
   - With optional dependencies
   - Without dependencies

4. **Documentation Check**
   - README is complete
   - Examples work as documented
   - No broken links

## 📤 Submitting Your Skill

### 1. Pre-Submission Checklist

- [ ] Skill follows naming conventions
- [ ] All required files present
- [ ] metadata.json is valid JSON
- [ ] No sensitive information included
- [ ] Examples are working
- [ ] Dependencies are documented
- [ ] License is compatible

### 2. Update skills.json

Add your skill entry to `skills.json`:
```json
{
  "id": "your-skill-name",
  "name": "Your Skill Name",
  "version": "1.0.0",
  "category": "category",
  "description": "Brief description",
  ...
}
```

### 3. Create Pull Request

```bash
git add .
git commit -m "feat: Add [skill-name] skill"
git push origin feature/add-skill-name
```

PR Title: `feat: Add [skill-name] skill`

PR Description:
```markdown
## New Skill: [Skill Name]

### Purpose
[What problem it solves]

### Key Features
- Feature 1
- Feature 2

### Testing
- [ ] Tested activation phrases
- [ ] Tested core functionality
- [ ] Tested error handling

### Checklist
- [ ] Follows contribution guidelines
- [ ] Includes all required files
- [ ] Documentation complete
```

## 🎨 Best Practices

### Do's
- ✅ Keep skills focused on a single purpose
- ✅ Provide comprehensive examples
- ✅ Handle errors gracefully
- ✅ Document all dependencies
- ✅ Use clear, intuitive activation phrases
- ✅ Test thoroughly before submitting

### Don'ts
- ❌ Don't duplicate existing skills
- ❌ Don't include sensitive data
- ❌ Don't use copyrighted code
- ❌ Don't create overly broad skills
- ❌ Don't skip documentation
- ❌ Don't ignore testing

## 🐛 Reporting Issues

Found a bug in an existing skill?

1. Check existing issues first
2. Create a new issue with:
   - Skill name and version
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Environment details

## 💡 Suggesting Enhancements

Have an idea for improvement?

1. Check if already suggested
2. Open a discussion or issue
3. Provide:
   - Current behavior
   - Desired behavior
   - Use cases
   - Potential implementation

## 🔄 Updating Existing Skills

To update a skill you maintain:

1. Increment version in `metadata.json`
2. Update `CHANGELOG` section
3. Update documentation if needed
4. Test all changes
5. Submit PR with title: `fix: Update [skill-name] to vX.X.X`

## 📊 Skill Metrics

Help us track skill quality:

- Report successful uses
- Share performance metrics
- Provide user feedback
- Suggest improvements

## 🤝 Community

### Getting Help

- Open a discussion for questions
- Join skill development discussions
- Review existing skills for examples
- Ask for feedback on skill ideas

### Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Help others learn and grow
- Celebrate contributions

## 📜 Legal

### License

- All skills must be MIT licensed
- Don't include proprietary code
- Respect third-party licenses
- Credit original authors

### Attribution

If your skill is based on or inspired by another project:
- Give proper credit
- Link to original source
- Respect original license

## 🎉 Recognition

Contributors will be:
- Listed in our Contributors section
- Credited in skill metadata
- Featured in release notes
- Celebrated in our community

## 📞 Contact

- **Issues**: [GitHub Issues](https://github.com/ggarg2510/claude-skills/issues)
- **Discussions**: [GitHub Discussions](https://github.com/ggarg2510/claude-skills/discussions)
- **Email**: contact@example.com

---

Thank you for contributing to Claude Skills Marketplace! Your skills help the entire Claude community work more efficiently.