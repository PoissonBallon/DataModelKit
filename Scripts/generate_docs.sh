swift build
sourcekitten doc --spm-module DataModelKit > datamodelkit.json
jazzy \
  --clean \
  --sourcekitten-sourcefile datamodelkit.json \
  --author Allan Vialatte \
  --author_url https://github.com/PoissonBallon \
  --github_url https://github.com/PoissonBallon/DataModelKit \
  --module DataModelKit \
