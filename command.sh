rm -rf star-wars-api-layer.zip
cd nodejs
npm install
rm -rf package-lock.json
cd ..
zip -r star-wars-api-layer.zip nodejs
echo "Delete object from s3 ..."
aws s3 rm s3://nextjs-portfolio/star-wars-api-layer.zip
echo "Uploading to s3 ..."
aws s3 cp star-wars-api-layer.zip s3://nextjs-portfolio/
echo "Creating a layer ..."
aws lambda publish-layer-version --layer-name "star-wars-api-layer-dependencies-layer" --description "Batch one of nodejs dependencies" --content "file://s3.json" --license-info "MIT" --compatible-runtimes "nodejs12.x"