# Merge with develop and resolve conflicts by all --ours
git merge prettifier/develop
for file in $(git diff --name-only --diff-filter U)
do
    git checkout --ours $file
    git add $file
done
git commit

npm run format-css
git commit -am 'lint CSS' -n

git rev-parse HEAD >> .git-blame-ignore-revs
git commit -am 'chore(blame-ignore): ignore commit of CSS lint'
