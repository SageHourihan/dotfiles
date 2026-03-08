# Load base dotfiles
for file in ~/.{bash_prompt,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load profile-specific overrides if present
[ -f ~/.aliases.local ] && source ~/.aliases.local;

# Load private aliases (gitignored — machine-specific, sensitive)
[ -f ~/.aliases.private ] && source ~/.aliases.private;
