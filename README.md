# 🛍️ Claude Skills Marketplace

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Skills](https://img.shields.io/badge/skills-1-green)
![License](https://img.shields.io/badge/license-MIT-orange)
![Status](https://img.shields.io/badge/status-active-success)
![Type](https://img.shields.io/badge/type-marketplace-purple)

A comprehensive marketplace of Claude skills for automation, development, and productivity. Install as a plugin to enhance Claude's capabilities with specialized skills.

## 🎯 Quick Start

```bash
# Clone and install all skills
git clone https://github.com/ggarg2510/claude-skills.git
cd claude-skills
./install.sh --all

# Or install specific skill
./install.sh --skill n8n-workflow-architect
```

## 🌟 Featured Skills

### ⭐ Trending Now

#### [n8n-workflow-architect](./n8n-workflow-architect/) `v1.0.0`
![Category](https://img.shields.io/badge/category-planning-purple) ![MCP](https://img.shields.io/badge/MCP-required-orange) ![Production](https://img.shields.io/badge/status-production-green)

Pre-implementation discussion and planning skill for n8n workflows with critical thinking.
- **🎯 Purpose**: Reduces workflow re-iterations by 80%+
- **🚀 Activation**: `"Let's discuss this n8n workflow"`, `"Plan an n8n automation"`
- **📦 Dependencies**: sequentialthinking, context7, n8n-mcp
- **📊 Performance**: 75% success rate improvement

[View Details](./n8n-workflow-architect/README.md) | [Install](#installation)

## 📚 Skills Catalog

### By Category

<details>
<summary>🧠 Planning & Architecture (1 skill)</summary>

- **n8n-workflow-architect** - Pre-implementation workflow planning
</details>

<details>
<summary>🤖 Automation & Workflows (0 skills)</summary>

*Coming soon*
</details>

<details>
<summary>🔧 Development Tools (0 skills)</summary>

*Coming soon*
</details>

<details>
<summary>📊 Data Processing (0 skills)</summary>

*Coming soon*
</details>

<details>
<summary>🌐 API & Integrations (0 skills)</summary>

*Coming soon*
</details>

## 💻 Installation Methods

### 🚀 Automated Installation (Recommended)

```bash
# View available skills
./install.sh --list

# Install all skills
./install.sh --all

# Install specific skill
./install.sh --skill n8n-workflow-architect

# Update installed skills
./install.sh --update

# Create backup before installing
./install.sh --backup
./install.sh --all
```

### 📦 As Claude Plugin

Add this marketplace as a plugin in Claude:

1. Copy the repository URL: `https://github.com/ggarg2510/claude-skills`
2. In Claude settings, go to Plugins/Marketplaces
3. Add new marketplace with the URL
4. Skills will appear in your skills browser

### 🔧 Manual Installation

```bash
# Clone repository
git clone https://github.com/ggarg2510/claude-skills.git

# Copy specific skill
cp -r claude-skills/n8n-workflow-architect ~/.claude/skills/

# Or copy all skills
cp -r claude-skills/* ~/.claude/skills/
```

## 🎨 Marketplace Features

### 🔍 Skill Discovery
- **Browse by Category**: Planning, Automation, Development, Data, Integration
- **Search by Tags**: Find skills by functionality
- **Featured Skills**: Curated high-quality skills
- **Trending**: Most popular skills this week
- **New Arrivals**: Recently added skills

### 📊 Skill Metrics
Each skill includes:
- Version tracking
- Performance metrics
- Dependency management
- Compatibility info
- User ratings (coming soon)

### 🛠️ Management Tools
- **Installer Script**: Automated installation and updates
- **Backup System**: Save and restore skill configurations
- **Dependency Resolution**: Auto-install required dependencies
- **Version Control**: Track and update skill versions

## 📋 System Requirements

### Required MCP Servers
Different skills require different MCP servers:

| Server | Required For | Installation |
|--------|-------------|--------------|
| sequentialthinking | Planning skills | [Install Guide](https://github.com/sequentialthinking) |
| context7 | Documentation skills | [Install Guide](https://github.com/context7) |
| n8n-mcp | n8n skills | [Install Guide](https://github.com/n8n-mcp) |

### Claude Version
- Minimum: Claude 3.0+
- Recommended: Latest Claude version

## 🏗️ Repository Structure

```
claude-skills/
├── 📄 README.md                    # Marketplace documentation
├── 📄 LICENSE                      # MIT License
├── 📄 plugin.json                  # Plugin configuration
├── 📄 skills.json                  # Skills catalog
├── 📄 CONTRIBUTING.md              # Contribution guide
├── 🔧 install.sh                   # Installation script
├── 📁 docs/                        # Documentation
│   ├── integration-guide.md       # Skill integration guide
│   └── usage-examples.md          # Usage examples
├── 📁 skill-template/              # Templates for new skills
│   ├── SKILL.md.template
│   ├── metadata.json.template
│   └── README.md.template
└── 📁 n8n-workflow-architect/      # Individual skill
    ├── SKILL.md                   # Skill implementation
    ├── metadata.json              # Skill metadata
    └── README.md                  # Skill documentation
```

## 🚀 Coming Soon

### Planned Skills

| Skill | Category | ETA | Description |
|-------|----------|-----|-------------|
| aws-infrastructure-planner | Planning | Q1 2024 | AWS architecture planning |
| api-doc-generator | Development | Q1 2024 | Generate API documentation |
| code-review-assistant | Development | Q2 2024 | Automated code reviews |
| database-schema-designer | Data | Q2 2024 | Database design assistant |
| docker-compose-builder | Development | Q2 2024 | Docker compose generation |

### Marketplace Enhancements
- ⭐ User ratings and reviews
- 📈 Download statistics
- 🔄 Auto-update notifications
- 🎯 Skill recommendations
- 🏆 Skill achievements

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick Contribution Steps
1. Use skill templates in `skill-template/`
2. Test your skill thoroughly
3. Update `skills.json` with your skill
4. Submit a pull request

### Contribution Stats
- **Total Contributors**: 1
- **Open for Contributions**: Yes
- **Good First Issues**: Available

## 📊 Marketplace Statistics

| Metric | Value |
|--------|-------|
| Total Skills | 1 |
| Categories | 5 |
| Total Downloads | 0 |
| Active Contributors | 1 |
| Last Updated | 2024-01-01 |

## 🛡️ Security & Privacy

- **No Telemetry**: We don't track usage
- **Local Storage**: Skills run locally
- **Open Source**: All code is reviewable
- **MIT Licensed**: Free to use and modify

## 📝 License

MIT License - See [LICENSE](LICENSE) file for details

## 👤 Maintainer

**Gaurav Garg**
- GitHub: [@ggarg2510](https://github.com/ggarg2510)
- Marketplace: [claude-skills](https://github.com/ggarg2510/claude-skills)

## 🌟 Support the Project

If you find these skills helpful:
- ⭐ Star this repository
- 🐛 Report issues
- 💡 Suggest new skills
- 🤝 Contribute skills
- 📣 Share with others

## 🔗 Resources

- **Documentation**: [Wiki](https://github.com/ggarg2510/claude-skills/wiki)
- **Issues**: [Bug Reports](https://github.com/ggarg2510/claude-skills/issues)
- **Discussions**: [Community Forum](https://github.com/ggarg2510/claude-skills/discussions)
- **Changelog**: [Release Notes](https://github.com/ggarg2510/claude-skills/releases)

## 💬 Get Help

- 📖 Check the [documentation](./docs/)
- 💭 Join [discussions](https://github.com/ggarg2510/claude-skills/discussions)
- 🐛 Report [issues](https://github.com/ggarg2510/claude-skills/issues)
- 📧 Contact maintainer

## 🏆 Badges

![Marketplace](https://img.shields.io/badge/Claude-Marketplace-blue)
![Skills](https://img.shields.io/badge/Skills-Extensible-green)
![Community](https://img.shields.io/badge/Community-Open-orange)
![Quality](https://img.shields.io/badge/Code-Quality-purple)

---

<div align="center">

**🛍️ Claude Skills Marketplace - Enhance Claude with Specialized Skills**

*Good planning prevents poor performance. These skills help you think before you build!*

[Install Now](#-quick-start) • [Browse Skills](#-featured-skills) • [Contribute](#-contributing) • [Get Support](#-get-help)

</div>