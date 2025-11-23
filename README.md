# claude-skills

A collection of Claude skills for enhanced automation, planning, and development workflows.

## 📚 Available Skills

### 1. [n8n-workflow-architect](./n8n-workflow-architect/)
Pre-implementation discussion and planning skill for n8n workflows with critical thinking and iterative refinement.
- **Purpose**: Reduces workflow re-iterations by 80%+ through thorough planning
- **Activation**: "Let's discuss this n8n workflow", "Plan an n8n automation"
- **Dependencies**: sequentialthinking, context7, n8n-mcp servers

## 🚀 Installation

### Option 1: Install All Skills
```bash
# Clone the repository
git clone https://github.com/ggarg2510/claude-skills.git

# Copy all skills to Claude's skill directory
cp -r claude-skills/* ~/.claude/skills/

# Restart Claude to load the skills
```

### Option 2: Install Individual Skills
```bash
# Clone the repository
git clone https://github.com/ggarg2510/claude-skills.git

# Copy specific skill
cp -r claude-skills/n8n-workflow-architect ~/.claude/skills/

# Restart Claude to load the skill
```

## 📋 Prerequisites

### Required MCP Servers
- **sequentialthinking**: For structured analysis and critical thinking
- **context7**: For fetching latest documentation
- **n8n-mcp**: For n8n-specific operations

### Installation of MCP Servers
Follow the official Claude MCP documentation to install required servers.

## 🏗️ Repository Structure
```
claude-skills/
├── README.md                    # This file
├── LICENSE                      # MIT License
├── n8n-workflow-architect/      # n8n planning skill
│   ├── SKILL.md                # Skill implementation
│   ├── metadata.json           # Skill configuration
│   └── README.md              # Skill documentation
└── [future-skill]/             # Your next skill here
    ├── SKILL.md
    ├── metadata.json
    └── README.md
```

## 🤝 Contributing

Feel free to contribute new skills or improve existing ones!

### Adding a New Skill
1. Create a new directory with your skill name
2. Add `SKILL.md` with the skill implementation
3. Add `metadata.json` with skill configuration
4. Add `README.md` with skill documentation
5. Update this main README to list your skill
6. Submit a pull request

### Skill Naming Convention
- Use lowercase with hyphens (e.g., `my-awesome-skill`)
- Be descriptive but concise
- Include the domain/tool if specific (e.g., `n8n-`, `aws-`, `docker-`)

## 📊 Skills Overview

| Skill | Category | Purpose | Dependencies |
|-------|----------|---------|--------------|
| n8n-workflow-architect | Planning | Pre-implementation n8n workflow planning | sequentialthinking, context7, n8n-mcp |
| _[Your skill here]_ | _[Category]_ | _[Purpose]_ | _[Dependencies]_ |

## 🛠️ Development

### Testing a Skill
1. Install the skill in your local Claude environment
2. Test activation phrases
3. Verify dependencies are working
4. Check integration with other skills

### Skill Best Practices
- Keep skills focused on a single purpose
- Document activation phrases clearly
- List all dependencies in metadata.json
- Provide clear examples in README
- Test thoroughly before committing

## 📝 License

MIT License - See [LICENSE](LICENSE) file for details

## 👤 Author

**Gaurav Garg**
- GitHub: [@ggarg2510](https://github.com/ggarg2510)

## 🌟 Star History

If you find these skills helpful, please star this repository!

## 🔗 Related Projects

- [n8n](https://n8n.io/) - Workflow automation tool
- [Claude](https://claude.ai/) - AI assistant
- [Claude MCP](https://modelcontextprotocol.io/) - Model Context Protocol

## 📈 Roadmap

### Planned Skills
- [ ] AWS infrastructure architect
- [ ] Docker compose generator
- [ ] API documentation writer
- [ ] Code review assistant
- [ ] Database schema designer

### Improvements
- [ ] Automated skill testing framework
- [ ] Skill dependency resolver
- [ ] Interactive skill configuration
- [ ] Skill marketplace integration

## 💬 Support

For issues, questions, or suggestions:
1. Open an issue on [GitHub](https://github.com/ggarg2510/claude-skills/issues)
2. Check existing skills for examples
3. Read the skill development guide

---

**Remember**: Good planning prevents poor performance. These skills help you think before you build!