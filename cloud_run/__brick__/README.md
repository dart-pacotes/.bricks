# {{name.lowerCase().snakeCase()}}

{{description}}

{{#isNodeEnvironment}}
## Setup

The script was built using Node `v14.20.0`. To run locally you need to have `npm` installed and then run the following commands:

```
npm install

npm start
```

These commands will first install any missing dependencies that are not present in the `node_modules` folder and then run the script. Also, make sure to copy the `.env.tpl` file to `.env` and update the environment variables with appropriate values.
{{#useFirebase}}In the `firebase` folder you will also find a .tpl file which corresponds to the **Firebase Google Service Account** private key used to initialize the Firebase Admin SDK. You can generate one in the **Service accounts** tab of Firebase Project Settings.{{/useFirebase}}
{{/isNodeEnvironment}}

---

Run the service locally using **Docker**, using the available `Dockerfile`.

```
local_port=8080
container_port=8080
docker_tag={{name.lowerCase().snakeCase()}}:latest

docker build . -t $docker_tag

docker run -p $local_port:$container_port -t $docker_tag
```

## Deploying to Cloud Run

Deploying to Cloud Run is as easy as executing some commands and triggering the container push using the `gcloud run` command (this requires the Google Cloud SDK to be installed on your machine). Otherwise, you need to trigger the push manually on [Cloud Run plaform](https://console.cloud.google.com/run/create?project=)

```
# Only run this if this is the first time running cloud run on your GCP account

gcloud services enable containerregistry.googleapis.com
gcloud auth configure-docker

# Tag container image and push it to Google Cloud Registry

docker_tag={{name.lowerCase().snakeCase()}}:latest
gcp_project_id={{name.lowerCase().paramCase()}}-cloud-run
gcp_container_tag={{name.lowerCase().snakeCase()}}:latest
gcp_cloud_run_name={{name.lowerCase().paramCase()}}

docker tag $docker_tag gcr.io/$gcp_project_id/$gcp_container_tag

docker push gcr.io/$gcp_project_id/$gcp_container_tag

# Deploy (start) container using gcloud

gcloud run deploy $gcp_cloud_run_name --image gcr.io/$gcp_project_id/$gcp_container_tag 
```

There is currently a service running on Cloud Run under the following host: `https://{{name.lowerCase().paramCase()}}-something.a.run.app`