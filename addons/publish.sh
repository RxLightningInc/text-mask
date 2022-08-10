echo "Expected arguments: 1) version"

version=$1

if [ -z "$version" ]; then
  echo "version is not set"
  exit 1
fi

npm run addons:build

npm run addons:verify

cd ./addons

generatedNpmVersion="$(npm version $version)"

npm publish

git tag "addons-${generatedNpmVersion}"
