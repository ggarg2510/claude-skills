#!/bin/bash

# Claude Skills Marketplace Installer
# Usage: ./install.sh [OPTIONS]
# Options:
#   --all                Install all skills
#   --skill SKILL_NAME   Install specific skill
#   --list              List available skills
#   --update            Update existing skills
#   --backup            Create backup before installing
#   --restore           Restore from backup
#   --uninstall SKILL   Uninstall a specific skill
#   --help              Show this help message

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"
BACKUP_DIR="$HOME/.claude/skills-backup"
MARKETPLACE_URL="https://github.com/ggarg2510/claude-skills.git"

# Functions
print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║   Claude Skills Marketplace Installer    ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Check if jq is installed for JSON parsing
check_dependencies() {
    if ! command -v jq &> /dev/null; then
        print_warning "jq is not installed. Installing jq for JSON parsing..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            brew install jq 2>/dev/null || {
                print_error "Failed to install jq. Please install it manually."
                exit 1
            }
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt-get install -y jq 2>/dev/null || sudo yum install -y jq 2>/dev/null || {
                print_error "Failed to install jq. Please install it manually."
                exit 1
            }
        fi
    fi
}

# Create necessary directories
setup_directories() {
    print_info "Setting up directories..."
    mkdir -p "$SKILLS_DIR"
    mkdir -p "$BACKUP_DIR"
    print_success "Directories created"
}

# List all available skills
list_skills() {
    print_header
    echo -e "${BLUE}Available Skills:${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    if [ -f "$SCRIPT_DIR/skills.json" ]; then
        jq -r '.skills[] | "\(.id) - \(.name) v\(.version)\n  └─ \(.description)"' "$SCRIPT_DIR/skills.json" | while IFS= read -r line; do
            echo -e "  ${GREEN}▸${NC} $line"
        done
    else
        print_error "skills.json not found"
        exit 1
    fi
    echo ""
}

# Install a specific skill
install_skill() {
    local skill_name=$1

    if [ -z "$skill_name" ]; then
        print_error "No skill name provided"
        return 1
    fi

    print_info "Installing skill: $skill_name"

    # Check if skill exists
    if [ ! -d "$SCRIPT_DIR/$skill_name" ]; then
        print_error "Skill '$skill_name' not found"
        return 1
    fi

    # Check if skill is already installed
    if [ -d "$SKILLS_DIR/$skill_name" ]; then
        print_warning "Skill '$skill_name' is already installed. Updating..."
        rm -rf "$SKILLS_DIR/$skill_name"
    fi

    # Copy skill to Claude skills directory
    cp -r "$SCRIPT_DIR/$skill_name" "$SKILLS_DIR/"

    # Check for dependencies
    if [ -f "$SCRIPT_DIR/$skill_name/metadata.json" ]; then
        local deps=$(jq -r '.dependencies.mcp_servers[]?' "$SCRIPT_DIR/$skill_name/metadata.json" 2>/dev/null)
        if [ -n "$deps" ]; then
            print_info "This skill requires the following MCP servers:"
            echo "$deps" | while IFS= read -r dep; do
                echo "  - $dep"
            done
        fi

        local skill_deps=$(jq -r '.dependencies.skills[]?' "$SCRIPT_DIR/$skill_name/metadata.json" 2>/dev/null)
        if [ -n "$skill_deps" ]; then
            print_info "This skill depends on the following skills:"
            echo "$skill_deps" | while IFS= read -r dep; do
                echo "  - $dep"
                # Optionally auto-install dependencies
                # install_skill "$dep"
            done
        fi
    fi

    print_success "Skill '$skill_name' installed successfully"
}

# Install all skills
install_all() {
    print_info "Installing all skills..."

    # Get list of skills from skills.json
    if [ -f "$SCRIPT_DIR/skills.json" ]; then
        skills=$(jq -r '.skills[].id' "$SCRIPT_DIR/skills.json")

        for skill in $skills; do
            if [ -d "$SCRIPT_DIR/$skill" ]; then
                install_skill "$skill"
            fi
        done
    else
        # Fallback: install all directories that look like skills
        for dir in "$SCRIPT_DIR"/*/; do
            if [ -d "$dir" ] && [ -f "$dir/SKILL.md" ]; then
                skill_name=$(basename "$dir")
                if [[ "$skill_name" != "skill-template" ]] && [[ "$skill_name" != "docs" ]]; then
                    install_skill "$skill_name"
                fi
            fi
        done
    fi

    print_success "All skills installed successfully"
}

# Update existing skills
update_skills() {
    print_info "Updating skills from marketplace..."

    # Pull latest changes
    cd "$SCRIPT_DIR"
    git pull origin main 2>/dev/null || {
        print_warning "Could not update from git. Using local version."
    }

    # Reinstall all installed skills
    for skill_dir in "$SKILLS_DIR"/*/; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            if [ -d "$SCRIPT_DIR/$skill_name" ]; then
                print_info "Updating $skill_name..."
                install_skill "$skill_name"
            fi
        fi
    done

    print_success "Skills updated successfully"
}

# Create backup
create_backup() {
    print_info "Creating backup..."

    timestamp=$(date +%Y%m%d_%H%M%S)
    backup_path="$BACKUP_DIR/backup_$timestamp"

    if [ -d "$SKILLS_DIR" ]; then
        cp -r "$SKILLS_DIR" "$backup_path"
        print_success "Backup created at: $backup_path"
    else
        print_warning "No skills directory to backup"
    fi
}

# Restore from backup
restore_backup() {
    print_info "Available backups:"

    if [ -d "$BACKUP_DIR" ]; then
        backups=($(ls -d "$BACKUP_DIR"/backup_* 2>/dev/null | sort -r))

        if [ ${#backups[@]} -eq 0 ]; then
            print_error "No backups found"
            return 1
        fi

        for i in "${!backups[@]}"; do
            echo "  $((i+1)). $(basename "${backups[$i]}")"
        done

        read -p "Select backup number to restore (or 'c' to cancel): " choice

        if [ "$choice" = "c" ]; then
            print_info "Restore cancelled"
            return 0
        fi

        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#backups[@]} ]; then
            backup_path="${backups[$((choice-1))]}"

            # Remove current skills
            rm -rf "$SKILLS_DIR"

            # Restore from backup
            cp -r "$backup_path" "$SKILLS_DIR"

            print_success "Restored from backup: $(basename "$backup_path")"
        else
            print_error "Invalid selection"
            return 1
        fi
    else
        print_error "No backup directory found"
        return 1
    fi
}

# Uninstall a skill
uninstall_skill() {
    local skill_name=$1

    if [ -z "$skill_name" ]; then
        print_error "No skill name provided"
        return 1
    fi

    if [ -d "$SKILLS_DIR/$skill_name" ]; then
        rm -rf "$SKILLS_DIR/$skill_name"
        print_success "Skill '$skill_name' uninstalled"
    else
        print_error "Skill '$skill_name' is not installed"
        return 1
    fi
}

# Show help
show_help() {
    print_header
    echo "Usage: ./install.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --all               Install all available skills"
    echo "  --skill SKILL_NAME  Install a specific skill"
    echo "  --list             List all available skills"
    echo "  --update           Update all installed skills"
    echo "  --backup           Create backup of current skills"
    echo "  --restore          Restore skills from backup"
    echo "  --uninstall SKILL  Uninstall a specific skill"
    echo "  --help             Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./install.sh --list"
    echo "  ./install.sh --skill n8n-workflow-architect"
    echo "  ./install.sh --all"
    echo "  ./install.sh --backup"
    echo ""
}

# Main script
main() {
    # Check dependencies
    check_dependencies

    # Parse arguments
    case "$1" in
        --all)
            setup_directories
            install_all
            ;;
        --skill)
            setup_directories
            install_skill "$2"
            ;;
        --list)
            list_skills
            ;;
        --update)
            update_skills
            ;;
        --backup)
            create_backup
            ;;
        --restore)
            restore_backup
            ;;
        --uninstall)
            uninstall_skill "$2"
            ;;
        --help|*)
            show_help
            ;;
    esac
}

# Run main function
main "$@"