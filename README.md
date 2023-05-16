## Test it yourself

1. Prepare environment  
Set environment variables.
```
export GOOGLE_CLOUD_PROJECT=<your project>
```
Log in your Google Account for Google Cloud Project.
```
gcloud auth login --update-adc
```

2. Create your Artifact Registory, and prepare Cloud Spanner table
```
make repo
make spanner
```

3. Build containers and deploy them to Cloud Run service
```
make all
```

4. Clean up your project when you end up
