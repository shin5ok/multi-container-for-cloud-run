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
You may be asked to enable some APIs.
```
make spanner repo
```

3. Build containers and deploy them to Cloud Run service
```
make all
```

4. Clean up  
Make sure remove your project when your test end up.
