## Test it yourself

### 1. Prepare environment  
- Set environment variables.  
```
export GOOGLE_CLOUD_PROJECT=<your project>
```
- Log in your Google Account for Google Cloud Project.  
```
gcloud auth login --update-adc
```

- Enable some APIs in advance.
```
gcloud services enable run.googleapis.com spanner.googleapis.com artifactregistry.googleapis.com
```

Note: Propagating effects enabling APIs may take a couple of minutes.

### 2. Create your Artifact Registory, and prepare Cloud Spanner table  
You may be asked to enable some APIs.
```
make spanner repo
```

### 3. Build containers and deploy them to Cloud Run service
```
make all
```

### 4. Just try
Try to access the url of Cloud Run service.  
You would be see 403 because of enabling IAM auth.

- PHP Info  
  ```https://<your Cloud Run URL>/```
- DB Communication  
  ```https://<your Cloud Run URL>/db.php```  
  Note: It would be very slow because we use Cloud Spanner Trial Instance as minimum scale.


### 5. Clean up  
Make sure to remove your project when your test end up.
