# LOAD ALL ALIASES
for alias_file in $(ls ~/.aliases/); do
  source ~/.aliases/"$alias_file"
done
